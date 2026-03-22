#!/usr/bin/env python3
"""
Experimento LPG-TD: Quality vs Speed – Escalado por drones/transportadores
===========================================================================

Para N = 1..10 drones (= transportadores) y cada modo:
  Busca el mayor tamaño S resuelto en < time-limit s.

Guarda resultados en:
  results/lpg_results.csv          – tiempo y coste (makespan) de cada problema/modo
  results/lpg_comparison.csv       – tabla comparativa quality vs speed (solo --mode both)
  results/lpg_comparison_table.txt – tabla legible (solo --mode both)

Requisito: planutils con LPG-TD instalado.
  Instalación: pip install planutils && planutils install lpg-td

Uso:
    python3 run_lpg_experiments.py [--max-drones 10] [--time-limit 60]
                                   [--mode quality|speed|both]
                                   [--skip-generation]
"""

import argparse
import csv
import os
import re
import subprocess
import sys
import time
from pathlib import Path

# --------------------------------------------------------------------------- #
# Rutas
# --------------------------------------------------------------------------- #
SCRIPT_DIR   = Path(__file__).parent.resolve()
REPO_ROOT    = SCRIPT_DIR.parent
SRC_DIR      = REPO_ROOT / "src"
DOMAIN_FILE  = SRC_DIR / "domain.pddl"
GENERATOR    = SRC_DIR / "generate-problem.py"
PROBLEMS_DIR = SRC_DIR / "generated"
RESULTS_DIR  = REPO_ROOT / "results"

# --------------------------------------------------------------------------- #
# Parámetros del experimento
# --------------------------------------------------------------------------- #
DEFAULT_MAX_DRONES = 10
DEFAULT_TIME_LIMIT = 60   # segundos
SUBPROCESS_BUFFER  = 15   # segundos extra de margen para subprocess.run

# Tamaños a probar en orden creciente
<<<<<<< HEAD
SIZES = [2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15]
=======
SIZES = [2, 3, 4, 5, 6, 7, 8, 10, 12, 15, 20, 25, 30]
>>>>>>> 82c9640 (reorganización y documentación actualizada)

# =========================================================================== #
# Utilidades
# =========================================================================== #

def find_lpg_binary() -> str | None:
    """Busca el binario lpg-td en ubicaciones conocidas."""
    # 1. Instalación estándar de planutils (~/.planutils)
    planutils_path = Path.home() / ".planutils" / "packages" / "lpg-td" / "bin" / "lpg-td"
    if planutils_path.exists():
        return str(planutils_path)

    # 2. En el PATH del sistema
    r = subprocess.run(["which", "lpg-td"], capture_output=True, text=True)
    if r.returncode == 0 and r.stdout.strip():
        return r.stdout.strip()

    return None


LPG_BINARY: str | None = None   # se rellena en main()


def check_planutils() -> bool:
    """Comprueba que lpg-td está disponible."""
    global LPG_BINARY
    LPG_BINARY = find_lpg_binary()
    if LPG_BINARY is None:
        print("ERROR: binario 'lpg-td' no encontrado.")
        print("  Instala con: pip install planutils && planutils install lpg-td")
        return False
    return True


def problem_params(n_drones: int, size: int):
    """Devuelve (crates, goals) para un problema de tamaño S."""
    crates = max(2, size)
    goals  = min(size, crates)
    return crates, goals


def problem_filename(n_drones: int, size: int) -> str:
    crates, goals = problem_params(n_drones, size)
    return (f"drone_problem_d{n_drones}_r0"
            f"_l{size}_p{size}_c{crates}_g{goals}_ct2.pddl")


def problem_path(n_drones: int, size: int) -> Path:
    return PROBLEMS_DIR / problem_filename(n_drones, size)


# =========================================================================== #
# Generación de problemas
# =========================================================================== #

def generate_problem(n_drones: int, size: int) -> Path | None:
    """Genera el problema si no existe. Devuelve la ruta o None si falla."""
    target = problem_path(n_drones, size)
    if target.exists():
        return target

    crates, goals = problem_params(n_drones, size)
    cmd = [
        sys.executable, str(GENERATOR),
        "-d", str(n_drones), "-r", "0",
        "-l", str(size), "-p", str(size),
        "-c", str(crates), "-g", str(goals),
    ]

    PROBLEMS_DIR.mkdir(parents=True, exist_ok=True)
    result = subprocess.run(cmd, capture_output=True, text=True, cwd=str(SRC_DIR))

    if result.returncode != 0 or not target.exists():
        print(f"    ERROR al generar {target.name}: {result.stderr.strip()}")
        return None
    return target


# =========================================================================== #
# Ejecución de LPG-TD
# =========================================================================== #

def run_lpg(problem_file: Path, mode: str, time_limit: int) -> dict:
    """
    Ejecuta LPG-TD directamente con timeout del SO.

    Equivale a:
      timeout <time_limit> lpg-td -o domain.pddl -f problem.pddl -<mode> -v off -noout

    Devuelve dict con claves:
      solved        bool
      cpu_time      float | None
      steps         int | None
      makespan      float | None
      raw_output    str
    """
    cmd = [
        "timeout", str(time_limit),
        LPG_BINARY,
        "-o", str(DOMAIN_FILE),
        "-f", str(problem_file),
        f"-{mode}",          # -quality  o  -speed
        "-v", "off",         # sin mensajes de progreso verboso
        "-noout",            # plan va a stdout, no crea ficheros externos
    ]

    t0 = time.perf_counter()
    try:
        proc = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            timeout=time_limit + SUBPROCESS_BUFFER,
        )
        wall_time = time.perf_counter() - t0
        # timeout(1) devuelve 124 cuando mata el proceso
        if proc.returncode == 124:
            return {
                "solved": False, "cpu_time": float(time_limit),
                "steps": None,   "makespan": None,
                "raw_output": "TIMEOUT (exit 124)",
            }
        output = proc.stdout + proc.stderr
    except subprocess.TimeoutExpired:
        return {
            "solved": False, "cpu_time": float(time_limit),
            "steps": None,   "makespan": None,
            "raw_output": "TIMEOUT (subprocess)",
        }

    return parse_lpg_output(output, wall_time)


def parse_lpg_output(output: str, wall_time: float) -> dict:
    """
    Extrae métricas del resumen que LPG-TD imprime con -noout.

    Formato esperado en stdout:
        Solution found:
        Total time:      52.10
        Actions:         32
        Plan quality:    1845.000
    """
    low = output.lower()

    # ---- ¿Se encontró solución? ----
    solved = "solution found" in low

    # ---- Número de acciones ----
    steps = None
    m = re.search(r"Actions:\s+(\d+)", output, re.IGNORECASE)
    if m:
        steps = int(m.group(1))

    # ---- Tiempo de CPU (Total time) ----
    cpu_time = None
    m = re.search(r"Total time:\s+([\d.]+)", output, re.IGNORECASE)
    if m:
        cpu_time = float(m.group(1))
    if cpu_time is None:
        cpu_time = wall_time

    # ---- Makespan / calidad del plan ----
    makespan = None
    for pattern in [
        r"Plan quality:\s+([\d.]+)",
        r"Duration:\s+([\d.]+)",
        r"Makespan:\s+([\d.]+)",
    ]:
        m = re.search(pattern, output, re.IGNORECASE)
        if m:
            makespan = float(m.group(1))
            break

    return {
        "solved":     solved,
        "cpu_time":   cpu_time,
        "steps":      steps,
        "makespan":   makespan,
        "raw_output": output[:4000],
    }


# =========================================================================== #
# Experimento principal
# =========================================================================== #

def run_mode(mode: str, max_drones: int, time_limit: int) -> dict[int, dict]:
    """
    Ejecuta LPG-TD en el modo indicado para todos los N drones.
    Devuelve best[n] -> row con el mayor tamaño resuelto para cada N.
    """
    print("\n" + "=" * 68)
    print(f" Modo {mode.upper()}: búsqueda del mayor problema resuelto")
    print("=" * 68)

    best: dict[int, dict] = {}

    for n in range(1, max_drones + 1):
        print(f"\n  N={n} drones / {n} transportadores:")
        last_solved = None

        for size in SIZES:
            pfile = generate_problem(n, size)
            if pfile is None:
                print(f"    size={size:>3}  GEN_ERROR")
                break   # si no podemos generar, parar con este N

            print(f"    size={size:>3}  ", end="", flush=True)
            res = run_lpg(pfile, mode, time_limit)

            solved   = res["solved"]
            cpu      = res["cpu_time"]
            steps    = res["steps"]
            makespan = res["makespan"]

            status = "OK" if solved and cpu < time_limit else (
                "TIMEOUT" if cpu >= time_limit else "FAILED"
            )
            print(f"{status:<8}  cpu={cpu:6.2f}s  "
                  f"steps={str(steps):<5}  makespan={makespan}")

            row = {
                "n_drones":     n,
                "problem_size": size,
                "mode":         mode,
                "status":       status,
                "cpu_time_s":   round(cpu, 3),
                "plan_steps":   steps,
                "makespan":     makespan,
                "problem_file": str(pfile),
            }

            if solved and cpu < time_limit:
                last_solved = row
            else:
                break   # primer fracaso → tamaños mayores tampoco resolverán

        if last_solved:
            best[n] = last_solved
            print(f"  => Mejor {mode} N={n}: size={last_solved['problem_size']}")
        else:
            print(f"  => Sin solución en {mode} para N={n}")

    return best


def run_experiment(max_drones: int, time_limit: int, mode: str):

    RESULTS_DIR.mkdir(parents=True, exist_ok=True)

    results_csv_path = RESULTS_DIR / "lpg_results.csv"
    compare_csv_path = RESULTS_DIR / "lpg_comparison.csv"
    table_txt_path   = RESULTS_DIR / "lpg_comparison_table.txt"

    modes_to_run = ["quality", "speed"] if mode == "both" else [mode]

    results_rows: list[dict] = []
    best_by_mode: dict[str, dict[int, dict]] = {}

    for current_mode in modes_to_run:
        best = run_mode(current_mode, max_drones, time_limit)
        best_by_mode[current_mode] = best
        results_rows.extend(best.values())

    # ------------------------------------------------------------------ #
    # CSV principal: tiempo y coste por problema/modo
    # ------------------------------------------------------------------ #
    flat_fieldnames = [
        "n_drones", "problem_size", "mode", "status",
        "cpu_time_s", "plan_steps", "makespan", "problem_file",
    ]
    with open(results_csv_path, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=flat_fieldnames)
        writer.writeheader()
        writer.writerows(results_rows)
    print(f"\nResultados guardados en: {results_csv_path}")

    # ------------------------------------------------------------------ #
    # CSV comparativo y tabla legible (solo cuando se ejecutan ambos modos)
    # ------------------------------------------------------------------ #
    if mode != "both":
        return

    quality_best = best_by_mode.get("quality", {})
    speed_best   = best_by_mode.get("speed",   {})

    compare_rows = []
    compare_fieldnames = [
        "n_drones", "problem_size",
        "quality_cpu_s", "quality_steps", "quality_makespan",
        "speed_cpu_s",   "speed_steps",   "speed_makespan",
        "makespan_improvement_pct",
    ]
    for n in range(1, max_drones + 1):
        q = quality_best.get(n)
        s = speed_best.get(n)
        if q is None and s is None:
            continue
        size = (q or s)["problem_size"]
        impr = None
        if (q and s
                and q["makespan"] is not None
                and s["makespan"] is not None
                and s["makespan"] > 0):
            impr = round((s["makespan"] - q["makespan"]) / s["makespan"] * 100, 1)
        compare_rows.append({
            "n_drones":                 n,
            "problem_size":             size,
            "quality_cpu_s":            q["cpu_time_s"]  if q else None,
            "quality_steps":            q["plan_steps"]  if q else None,
            "quality_makespan":         q["makespan"]    if q else None,
            "speed_cpu_s":              s["cpu_time_s"]  if s else None,
            "speed_steps":              s["plan_steps"]  if s else None,
            "speed_makespan":           s["makespan"]    if s else None,
            "makespan_improvement_pct": impr,
        })

    with open(compare_csv_path, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=compare_fieldnames)
        writer.writeheader()
        writer.writerows(compare_rows)
    print(f"Tabla comparativa guardada en:  {compare_csv_path}")

    # ------------------------------------------------------------------ #
    # Tabla legible
    # ------------------------------------------------------------------ #
    def fmt(v, fmt_str):
        return format(v, fmt_str) if v is not None else "N/A"

    sep   = "-" * 100
    lines = [
        "\n" + "=" * 100,
        "TABLA COMPARATIVA: LPG-TD Quality vs Speed",
        "=" * 100,
        f"{'N':>3}  {'Size':>5}  "
        f"{'Q-CPU(s)':>9}  {'Q-Steps':>8}  {'Q-Makespan':>11}  "
        f"{'S-CPU(s)':>9}  {'S-Steps':>8}  {'S-Makespan':>11}  "
        f"{'Δ-Makespan%':>12}",
        sep,
    ]
    for row in compare_rows:
        impr_str = (f"{row['makespan_improvement_pct']:+.1f}%"
                    if row["makespan_improvement_pct"] is not None else "N/A")
        lines.append(
            f"{row['n_drones']:>3}  "
            f"{row['problem_size']:>5}  "
            f"{fmt(row['quality_cpu_s'],   '9.2f')}  "
            f"{fmt(row['quality_steps'],   '8')  }  "
            f"{fmt(row['quality_makespan'],'11.1f')}  "
            f"{fmt(row['speed_cpu_s'],     '9.2f')}  "
            f"{fmt(row['speed_steps'],     '8')  }  "
            f"{fmt(row['speed_makespan'],  '11.1f')}  "
            f"{impr_str:>12}"
        )
    lines += [
        sep,
        "Δ-Makespan% = (speed - quality) / speed × 100  "
        "(negativo = quality PEOR, positivo = quality MEJOR)",
        "=" * 100,
    ]

    table_str = "\n".join(lines)
    print(table_str)

    with open(table_txt_path, "w") as f:
        f.write(table_str + "\n")
    print(f"Tabla de texto guardada en:     {table_txt_path}")


# =========================================================================== #
# Punto de entrada
# =========================================================================== #

def main():
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument("--max-drones", type=int, default=DEFAULT_MAX_DRONES,
                        help="Número máximo de drones (def: 10)")
    parser.add_argument("--time-limit", type=int, default=DEFAULT_TIME_LIMIT,
                        help="Límite de tiempo en segundos (def: 60)")
    parser.add_argument("--mode", choices=["quality", "speed", "both"],
                        default="both",
                        help="Modo de planificación a ejecutar (def: both)")
    parser.add_argument("--skip-generation", action="store_true",
                        help="No regenerar problemas que ya existan (siempre activo)")
    args = parser.parse_args()

    # Comprobar planutils
    if not check_planutils():
        sys.exit(1)

    print(f"Usando:        {LPG_BINARY}")
    print(f"Dominio:       {DOMAIN_FILE}")
    print(f"Límite tiempo: {args.time_limit}s")
    print(f"Max drones:    {args.max_drones}")
    print(f"Modo:          {args.mode}")

    if not DOMAIN_FILE.exists():
        print(f"\nERROR: dominio no encontrado: {DOMAIN_FILE}")
        sys.exit(1)

    run_experiment(args.max_drones, args.time_limit, args.mode)


if __name__ == "__main__":
    main()
