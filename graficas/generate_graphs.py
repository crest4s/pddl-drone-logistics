"""
Generador de gráficas estadísticas - Práctica de Planificación Automática
Genera 8 figuras a partir de los resultados de los experimentos.
Requiere: matplotlib
"""

import os
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np

OUTPUT_DIR = os.path.dirname(os.path.abspath(__file__))

# ---------------------------------------------------------------------------
# Datos extraídos de los CSVs
# ---------------------------------------------------------------------------

# Parte 1.2 – FF planner
ff_sizes       = [2,3,4,5,6,7,8,9,10,11,12,13,14,15,20,25,30,35,39,40]
ff_times       = [0.086,0.066,0.066,0.064,0.062,0.063,0.068,0.082,0.074,0.086,
                  0.096,0.159,0.128,0.136,0.909,2.364,5.048,19.731,27.932,67.865]
ff_plan_lens   = [6,10,14,18,20,22,26,32,34,38,44,46,48,56,70,90,102,126,136,148]

# Parte 1.3.1 – Comparativa algoritmos (BFS, IDS, A*+hMAX, GBFS+hMAX)
algos_names    = ['BFS', 'IDS', 'A*+hMAX', 'GBFS+hMAX']
algos_max_size = [5, 3, 4, 4]          # tamaño máximo resuelto (l=N)

# Tiempos por problema (l2, l3, l4) donde disponible, None si timeout
algos_l2_times = [0.00079, 0.0034, 0.0072, 0.0031]
algos_l3_times = [0.021,   1.4,    0.23,   0.021 ]
algos_l4_times = [0.61,    None,   9.5,    1.9   ]   # IDS timeout en l4

# Parte 1.3.2 – Heurísticas satisficing en S-1 (l4)
heuristics       = ['hMAX', 'hADD', 'hFF', 'Landmark']
gbfs_times       = [1.9,   0.012, 0.014, 0.0026]
ehc_times        = [2.4,   0.062, 0.023, 0.0065]
gbfs_actions     = [17, 15, 14, 16]
ehc_actions      = [14, 13, 15, 19]

# Parte 1.3.3 – Planificadores óptimos en S-1 (l4)
opt_names        = ['BFS', 'A*+hMAX', 'A*+lmcut']
opt_times        = [0.59,  8.9,       6.1       ]
opt_actions      = [13,    13,        13        ]

# Parte 2.2 – Planificadores satisficing con costes
sat_planners     = ['lama-first', 'seq-sat-fdss-2', 'seq-sat-fd-autotune-2']
sat_max_size     = [74,  5,   255]
sat_times        = [52.28, 46.09, 59.83]

# Parte 3 – LPG-TD quality vs speed
# Drones para los que tenemos datos en AMBOS modos
lpg_drones       = [1, 2, 3, 4, 5, 6, 7, 8]
# Quality mode (máximo problema resuelto ≤60s)
quality_makespan = [2611, 478, 438, 278, 318, 525, 418, 339]
# Speed mode (mismo nº de drones)
speed_makespan   = [2611, 1005, 521, 624, 503, 487, 418, 354]


# ---------------------------------------------------------------------------
# Figura 1 – FF: Escalabilidad (tiempo vs tamaño, eje Y log)
# ---------------------------------------------------------------------------
def fig1_ff_scalability():
    fig, ax = plt.subplots(figsize=(10, 5))
    ax.plot(ff_sizes, ff_times, marker='o', color='steelblue', linewidth=2, markersize=5)
    ax.set_yscale('log')
    ax.axhline(y=60, color='red', linestyle='--', linewidth=1.2, label='Límite 1 min')
    ax.set_xlabel('Tamaño del problema (l = p = c = g)', fontsize=12)
    ax.set_ylabel('Tiempo (s) – escala logarítmica', fontsize=12)
    ax.set_title('Fig 1 – FF: Escalabilidad (Parte 1.2)', fontsize=13)
    ax.legend()
    ax.grid(True, which='both', alpha=0.3)
    fig.tight_layout()
    path = os.path.join(OUTPUT_DIR, 'fig1_ff_scalability.png')
    fig.savefig(path, dpi=150)
    plt.close(fig)
    print(f'Guardada: {path}')


# ---------------------------------------------------------------------------
# Figura 2 – FF: Longitud del plan vs tamaño
# ---------------------------------------------------------------------------
def fig2_ff_plan_length():
    fig, ax = plt.subplots(figsize=(10, 5))
    ax.plot(ff_sizes, ff_plan_lens, marker='s', color='darkorange', linewidth=2, markersize=5)
    ax.set_xlabel('Tamaño del problema (l = p = c = g)', fontsize=12)
    ax.set_ylabel('Longitud del plan (acciones)', fontsize=12)
    ax.set_title('Fig 2 – FF: Longitud del plan vs tamaño (Parte 1.2)', fontsize=13)
    ax.grid(True, alpha=0.3)
    fig.tight_layout()
    path = os.path.join(OUTPUT_DIR, 'fig2_ff_plan_length.png')
    fig.savefig(path, dpi=150)
    plt.close(fig)
    print(f'Guardada: {path}')


# ---------------------------------------------------------------------------
# Figura 3 – Algoritmos: Máximo tamaño resuelto
# ---------------------------------------------------------------------------
def fig3_algo_max_size():
    colors = ['#4878CF', '#6ACC65', '#D65F5F', '#B47CC7']
    fig, ax = plt.subplots(figsize=(8, 5))
    bars = ax.barh(algos_names, algos_max_size, color=colors, edgecolor='white')
    ax.bar_label(bars, fmt='l%d', padding=4, fontsize=11)
    ax.set_xlabel('Máximo tamaño resuelto en < 1 min', fontsize=12)
    ax.set_title('Fig 3 – Tamaño máximo resuelto por algoritmo (Parte 1.3.1)', fontsize=13)
    ax.set_xlim(0, max(algos_max_size) + 2)
    ax.grid(True, axis='x', alpha=0.3)
    fig.tight_layout()
    path = os.path.join(OUTPUT_DIR, 'fig3_algo_max_size.png')
    fig.savefig(path, dpi=150)
    plt.close(fig)
    print(f'Guardada: {path}')


# ---------------------------------------------------------------------------
# Figura 4 – Algoritmos: Comparativa de tiempos en l2, l3, l4
# ---------------------------------------------------------------------------
def fig4_algo_time_comparison():
    problems = ['l2', 'l3', 'l4']
    times_matrix = [
        algos_l2_times,
        algos_l3_times,
        algos_l4_times,
    ]

    x = np.arange(len(problems))
    width = 0.18
    colors = ['#4878CF', '#6ACC65', '#D65F5F', '#B47CC7']

    fig, ax = plt.subplots(figsize=(10, 6))
    for i, (algo, color) in enumerate(zip(algos_names, colors)):
        vals = [times_matrix[p][i] if times_matrix[p][i] is not None else 0
                for p in range(len(problems))]
        rects = ax.bar(x + i * width, vals, width, label=algo, color=color, edgecolor='white')
        # Mark timeout bars
        for j, v in enumerate(times_matrix):
            if v[i] is None:
                ax.text(j + i * width, 1.5, 'T/O', ha='center', va='bottom',
                        fontsize=8, color='red', rotation=90)

    ax.set_yscale('log')
    ax.set_xticks(x + width * 1.5)
    ax.set_xticklabels(problems)
    ax.set_xlabel('Tamaño del problema', fontsize=12)
    ax.set_ylabel('Tiempo (s) – escala logarítmica', fontsize=12)
    ax.set_title('Fig 4 – Tiempo por algoritmo en l2, l3, l4 (Parte 1.3.1)', fontsize=13)
    ax.legend()
    ax.grid(True, axis='y', which='both', alpha=0.3)
    fig.tight_layout()
    path = os.path.join(OUTPUT_DIR, 'fig4_algo_time_comparison.png')
    fig.savefig(path, dpi=150)
    plt.close(fig)
    print(f'Guardada: {path}')


# ---------------------------------------------------------------------------
# Figura 5 – Heurísticas: Tiempo GBFS/EHC × heurística
# ---------------------------------------------------------------------------
def fig5_heuristics_time():
    x = np.arange(len(heuristics))
    width = 0.35
    fig, ax = plt.subplots(figsize=(9, 5))
    ax.bar(x - width/2, gbfs_times, width, label='GBFS', color='steelblue', edgecolor='white')
    ax.bar(x + width/2, ehc_times,  width, label='EHC',  color='darkorange', edgecolor='white')
    ax.set_yscale('log')
    ax.set_xticks(x)
    ax.set_xticklabels(heuristics)
    ax.set_xlabel('Heurística', fontsize=12)
    ax.set_ylabel('Tiempo (s) – escala logarítmica', fontsize=12)
    ax.set_title('Fig 5 – Tiempo GBFS/EHC × heurística en S-1 (l4) (Parte 1.3.2)', fontsize=13)
    ax.legend()
    ax.grid(True, axis='y', which='both', alpha=0.3)
    fig.tight_layout()
    path = os.path.join(OUTPUT_DIR, 'fig5_heuristics_time.png')
    fig.savefig(path, dpi=150)
    plt.close(fig)
    print(f'Guardada: {path}')


# ---------------------------------------------------------------------------
# Figura 6 – Heurísticas: Nº acciones GBFS/EHC × heurística
# ---------------------------------------------------------------------------
def fig6_heuristics_quality():
    x = np.arange(len(heuristics))
    width = 0.35
    fig, ax = plt.subplots(figsize=(9, 5))
    bars_gbfs = ax.bar(x - width/2, gbfs_actions, width, label='GBFS', color='steelblue', edgecolor='white')
    bars_ehc  = ax.bar(x + width/2, ehc_actions,  width, label='EHC',  color='darkorange', edgecolor='white')
    ax.bar_label(bars_gbfs, padding=2, fontsize=9)
    ax.bar_label(bars_ehc,  padding=2, fontsize=9)
    ax.set_xticks(x)
    ax.set_xticklabels(heuristics)
    ax.set_xlabel('Heurística', fontsize=12)
    ax.set_ylabel('Número de acciones del plan', fontsize=12)
    ax.set_title('Fig 6 – Calidad del plan GBFS/EHC × heurística en S-1 (l4) (Parte 1.3.2)', fontsize=13)
    ax.set_ylim(0, max(max(gbfs_actions), max(ehc_actions)) + 4)
    ax.legend()
    ax.grid(True, axis='y', alpha=0.3)
    fig.tight_layout()
    path = os.path.join(OUTPUT_DIR, 'fig6_heuristics_quality.png')
    fig.savefig(path, dpi=150)
    plt.close(fig)
    print(f'Guardada: {path}')


# ---------------------------------------------------------------------------
# Figura 7 – Parte 2.2: Planificadores satisficing (tamaño máximo y tiempo)
# ---------------------------------------------------------------------------
def fig7_sat_planners():
    x = np.arange(len(sat_planners))
    width = 0.35
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12, 5))

    colors = ['#4878CF', '#6ACC65', '#D65F5F']

    bars1 = ax1.bar(x, sat_max_size, color=colors, edgecolor='white')
    ax1.bar_label(bars1, fmt='l%d', padding=3, fontsize=10)
    ax1.set_yscale('log')
    ax1.set_xticks(x)
    ax1.set_xticklabels(sat_planners, rotation=15, ha='right')
    ax1.set_ylabel('Tamaño máximo resuelto – escala log', fontsize=11)
    ax1.set_title('Tamaño máximo resuelto (< 1 min)', fontsize=12)
    ax1.grid(True, axis='y', which='both', alpha=0.3)

    bars2 = ax2.bar(x, sat_times, color=colors, edgecolor='white')
    ax2.bar_label(bars2, fmt='%.2fs', padding=3, fontsize=10)
    ax2.set_xticks(x)
    ax2.set_xticklabels(sat_planners, rotation=15, ha='right')
    ax2.set_ylabel('Tiempo de resolución (s)', fontsize=11)
    ax2.set_title('Tiempo para el problema más grande resuelto', fontsize=12)
    ax2.grid(True, axis='y', alpha=0.3)

    fig.suptitle('Fig 7 – Planificadores satisficing con costes (Parte 2.2)', fontsize=13)
    fig.tight_layout()
    path = os.path.join(OUTPUT_DIR, 'fig7_sat_planners.png')
    fig.savefig(path, dpi=150)
    plt.close(fig)
    print(f'Guardada: {path}')


# ---------------------------------------------------------------------------
# Figura 8 – Parte 3: Quality vs Speed (makespan por nº drones)
# ---------------------------------------------------------------------------
def fig8_lpg_quality_vs_speed():
    x = np.arange(len(lpg_drones))
    width = 0.35
    fig, ax = plt.subplots(figsize=(11, 6))
    bars_q = ax.bar(x - width/2, quality_makespan, width, label='Quality', color='steelblue', edgecolor='white')
    bars_s = ax.bar(x + width/2, speed_makespan,   width, label='Speed',   color='tomato',    edgecolor='white')
    ax.bar_label(bars_q, padding=2, fontsize=8, rotation=90)
    ax.bar_label(bars_s, padding=2, fontsize=8, rotation=90)
    ax.set_xticks(x)
    ax.set_xticklabels([f'{d} dron(es)' for d in lpg_drones], rotation=20, ha='right')
    ax.set_ylabel('Makespan (duración total del plan)', fontsize=12)
    ax.set_title('Fig 8 – LPG-TD Quality vs Speed: makespan por nº de drones (Parte 3)', fontsize=13)
    ax.legend()
    ax.grid(True, axis='y', alpha=0.3)
    ax.set_ylim(0, max(max(quality_makespan), max(speed_makespan)) * 1.25)
    fig.tight_layout()
    path = os.path.join(OUTPUT_DIR, 'fig8_lpg_quality_vs_speed.png')
    fig.savefig(path, dpi=150)
    plt.close(fig)
    print(f'Guardada: {path}')


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
if __name__ == '__main__':
    print(f'Generando gráficas en: {OUTPUT_DIR}')
    fig1_ff_scalability()
    fig2_ff_plan_length()
    fig3_algo_max_size()
    fig4_algo_time_comparison()
    fig5_heuristics_time()
    fig6_heuristics_quality()
    fig7_sat_planners()
    fig8_lpg_quality_vs_speed()
    print('¡Todas las gráficas generadas correctamente!')
