#!/usr/bin/env python3
"""
Generador de problemas para experimento LPG-TD (Parte 3, Ejercicio final).

Genera problemas PDDL para N drones (1-10) x tamaños crecientes S.
Los transportadores se auto-generan igual al número de drones (comportamiento
del generador base: transporter[i] = drone[i]).

Uso:
    python3 generate_lpg_problems.py [--max-drones 10] [--sizes 2,3,4,5,6,7,8,10,12,15,20,25,30]
    python3 generate_lpg_problems.py --dry-run     # solo muestra qué generaría
"""

import subprocess
import sys
import os
import argparse
from pathlib import Path

# --------------------------------------------------------------------------- #
# Rutas
# --------------------------------------------------------------------------- #
SCRIPT_DIR  = Path(__file__).parent.resolve()
REPO_ROOT   = SCRIPT_DIR.parent
SRC_DIR     = REPO_ROOT / "src"
GENERATOR   = SRC_DIR / "generate-problem.py"
OUT_DIR     = SRC_DIR / "generated"          # el generador escribe aquí

# --------------------------------------------------------------------------- #
# Parámetros por defecto del experimento
# --------------------------------------------------------------------------- #
DEFAULT_MAX_DRONES = 10
DEFAULT_SIZES      = [2, 3, 4, 5, 6, 7, 8, 10, 12, 15, 20, 25, 30]


def problem_name(n_drones: int, size: int) -> str:
    """Devuelve el nombre del fichero PDDL que el generador va a crear."""
    crates = max(2, size)
    goals  = min(size, crates)
    return (
        f"drone_problem_d{n_drones}_r0"
        f"_l{size}_p{size}_c{crates}_g{goals}_ct2.pddl"
    )


def problem_path(n_drones: int, size: int) -> Path:
    return OUT_DIR / problem_name(n_drones, size)


def generate_one(n_drones: int, size: int, dry_run: bool = False) -> bool:
    """Genera un problema si no existe ya. Devuelve True si se generó/existe."""
    target = problem_path(n_drones, size)

    if target.exists():
        print(f"  [SKIP] {target.name}  (ya existe)")
        return True

    crates = max(2, size)
    goals  = min(size, crates)

    cmd = [
        sys.executable, str(GENERATOR),
        "-d", str(n_drones),
        "-r", "0",
        "-l", str(size),
        "-p", str(size),
        "-c", str(crates),
        "-g", str(goals),
    ]

    print(f"  [GEN]  {target.name}  (drones={n_drones}, size={size})")
    if dry_run:
        return True

    OUT_DIR.mkdir(parents=True, exist_ok=True)

    result = subprocess.run(
        cmd,
        capture_output=True,
        text=True,
        cwd=str(SRC_DIR),   # el generador escribe en ./generated relativo a SRC_DIR
    )

    if result.returncode != 0:
        print(f"    ERROR: {result.stderr.strip()}")
        return False

    # El generador escribe el fichero en OUT_DIR con el nombre estándar
    if not target.exists():
        print(f"    ERROR: fichero no encontrado tras generación: {target}")
        return False

    return True


def main():
    parser = argparse.ArgumentParser(description=__doc__,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--max-drones", type=int, default=DEFAULT_MAX_DRONES,
                        help="Número máximo de drones/transportadores (def: 10)")
    parser.add_argument("--sizes", type=str,
                        default=",".join(map(str, DEFAULT_SIZES)),
                        help="Lista de tamaños S separados por comas")
    parser.add_argument("--dry-run", action="store_true",
                        help="Solo muestra qué se generaría, sin ejecutar")
    args = parser.parse_args()

    sizes = [int(s) for s in args.sizes.split(",")]
    n_range = range(1, args.max_drones + 1)

    total = len(list(n_range)) * len(sizes)
    generated = 0
    skipped   = 0
    errors    = 0

    print(f"\nGenerando problemas para N=1..{args.max_drones}, "
          f"tamaños={sizes}\n")

    for n in n_range:
        print(f"N={n} drones:")
        for size in sizes:
            ok = generate_one(n, size, dry_run=args.dry_run)
            if ok:
                if problem_path(n, size).exists() or args.dry_run:
                    generated += 1
            else:
                errors += 1

    print(f"\nResumen: {generated} problemas listos, {errors} errores "
          f"(de {total} totales)")
    if errors:
        sys.exit(1)


if __name__ == "__main__":
    main()
