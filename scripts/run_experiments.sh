#!/bin/bash

# Script para automatizar experimentos del Ejercicio 1.3
# Uso: ./run_experiments.sh

echo "==================================="
echo "Experimentos Ejercicio 1.3"
echo "==================================="

DOMAIN="domain.pddl"
TIMEOUT=60

# Función para ejecutar pyperplan con timeout
run_pyperplan() {
    local search=$1
    local heuristic=$2
    local problem=$3
    local output=$4
    
    echo "Ejecutando: $search ${heuristic:+-H $heuristic} en $problem"
    
    if [ -z "$heuristic" ]; then
        timeout $TIMEOUT pyperplan -s $search $DOMAIN $problem > $output 2>&1
    else
        timeout $TIMEOUT pyperplan -s $search -H $heuristic $DOMAIN $problem > $output 2>&1
    fi
    
    local exit_code=$?
    if [ $exit_code -eq 124 ]; then
        echo "TIMEOUT" >> $output
    fi
}

# Crear directorio para resultados
mkdir -p results

echo ""
echo "==================================="
echo "1. Generando problemas de prueba..."
echo "==================================="

# Generar serie de problemas de complejidad creciente
for size in 3 5 7 10 15 20; do
    python3 generate-problem.py -d 1 -r 0 -l $size -p $size -c $size -g $size
    echo "Generado problema de tamaño $size"
done

echo ""
echo "==================================="
echo "2. Ejercicio 1.3.1: Comparativa algoritmos básicos"
echo "==================================="

# Probar BFS, IDS, A*, GBFS con hMAX en problemas crecientes
for size in 3 5 7 10; do
    problem="drone_problem_d1_r0_l${size}_p${size}_c${size}_g${size}_ct2.pddl"
    
    if [ -f "$problem" ]; then
        echo "--- Probando con problema de tamaño $size ---"
        
        run_pyperplan "bfs" "" "$problem" "results/bfs_size${size}.txt"
        run_pyperplan "ids" "" "$problem" "results/ids_size${size}.txt"
        run_pyperplan "astar" "hmax" "$problem" "results/astar_hmax_size${size}.txt"
        run_pyperplan "gbfs" "hmax" "$problem" "results/gbfs_hmax_size${size}.txt"
    fi
done

echo ""
echo "==================================="
echo "3. Ejercicio 1.3.2: Heurísticas satisficing"
echo "==================================="

# Encuentra el problema de mayor tamaño que GBFS puede resolver
# Asumiendo que es tamaño 10 (ajustar según resultados)
SATISFICING_PROBLEM="drone_problem_d1_r0_l10_p10_c10_g10_ct2.pddl"

if [ -f "$SATISFICING_PROBLEM" ]; then
    echo "Probando GBFS y EHC con todas las heurísticas en $SATISFICING_PROBLEM"
    
    for heuristic in hmax hadd hff landmark; do
        run_pyperplan "gbfs" "$heuristic" "$SATISFICING_PROBLEM" "results/gbfs_${heuristic}.txt"
        run_pyperplan "ehc" "$heuristic" "$SATISFICING_PROBLEM" "results/ehc_${heuristic}.txt"
    done
fi

echo ""
echo "==================================="
echo "4. Ejercicio 1.3.3: Heurísticas admisibles para óptimos"
echo "==================================="

# Encuentra el problema de mayor tamaño que A* puede resolver
# Asumiendo que es tamaño 7 (ajustar según resultados)
OPTIMAL_PROBLEM="drone_problem_d1_r0_l7_p7_c7_g7_ct2.pddl"

if [ -f "$OPTIMAL_PROBLEM" ]; then
    echo "Probando algoritmos óptimos en $OPTIMAL_PROBLEM"
    
    run_pyperplan "bfs" "" "$OPTIMAL_PROBLEM" "results/optimal_bfs.txt"
    run_pyperplan "ids" "" "$OPTIMAL_PROBLEM" "results/optimal_ids.txt"
    run_pyperplan "astar" "hmax" "$OPTIMAL_PROBLEM" "results/optimal_astar_hmax.txt"
    run_pyperplan "astar" "lmcut" "$OPTIMAL_PROBLEM" "results/optimal_astar_lmcut.txt"
fi

echo ""
echo "==================================="
echo "5. Extrayendo resultados..."
echo "==================================="

# Script Python para parsear resultados
python3 << 'EOF'
import re
import os
from pathlib import Path

results_dir = Path("results")

def parse_pyperplan_output(filepath):
    """Extrae métricas de la salida de pyperplan"""
    if not filepath.exists():
        return None
    
    content = filepath.read_text()
    
    if "TIMEOUT" in content:
        return {"timeout": True}
    
    metrics = {}
    
    # Buscar tiempo
    time_match = re.search(r'time: ([\d.]+)', content)
    if time_match:
        metrics['time'] = float(time_match.group(1))
    
    # Buscar longitud del plan
    plan_match = re.search(r'plan length: (\d+)', content)
    if plan_match:
        metrics['plan_length'] = int(plan_match.group(1))
    
    # Buscar nodos expandidos
    expanded_match = re.search(r'expanded: (\d+)', content)
    if expanded_match:
        metrics['expanded'] = int(expanded_match.group(1))
    
    return metrics

print("\n=== RESUMEN DE RESULTADOS ===\n")

# Ejercicio 1.3.1
print("Ejercicio 1.3.1: Comparativa Algoritmos")
print("-" * 80)
print(f"{'Algoritmo':<15} {'Tamaño':<10} {'Tiempo (s)':<12} {'Acciones':<10} {'Expandidos':<12}")
print("-" * 80)

for size in [3, 5, 7, 10]:
    for algo in ['bfs', 'ids', 'astar_hmax', 'gbfs_hmax']:
        filepath = results_dir / f"{algo}_size{size}.txt"
        metrics = parse_pyperplan_output(filepath)
        
        if metrics:
            if metrics.get('timeout'):
                print(f"{algo:<15} {size:<10} {'TIMEOUT':<12} {'-':<10} {'-':<12}")
            else:
                time = metrics.get('time', '-')
                plan_len = metrics.get('plan_length', '-')
                expanded = metrics.get('expanded', '-')
                print(f"{algo:<15} {size:<10} {time:<12.3f} {plan_len:<10} {expanded:<12}")

print("\n" + "=" * 80 + "\n")

EOF

echo ""
echo "==================================="
echo "Experimentos completados!"
echo "Revisa la carpeta 'results/' para los detalles"
echo "==================================="
