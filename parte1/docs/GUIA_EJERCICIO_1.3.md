# Guía para el Ejercicio 1.3 – Comparativa de Rendimiento

## Objetivo

Comparar algoritmos de búsqueda y heurísticas del planificador **pyperplan** usando problemas generados con el generador de la Parte 1.

## Preparación

Instalar pyperplan:

```bash
pip install pyperplan
```

Generar problemas de complejidad creciente:

```bash
python3 src/generate-problem.py -d 1 -r 0 -l 3 -p 3 -c 3 -g 3 > src/generated/problem_l3.pddl
python3 src/generate-problem.py -d 1 -r 0 -l 4 -p 4 -c 4 -g 4 > src/generated/problem_l4.pddl
python3 src/generate-problem.py -d 1 -r 0 -l 5 -p 5 -c 5 -g 5 > src/generated/problem_l5.pddl
```

## Apartado 1 – Algoritmos básicos (BFS, IDS, A*, GBFS)

Ejecutar cada algoritmo con un límite de 1 minuto:

```bash
timeout 60 pyperplan -a bfs    src/domain.pddl src/generated/problem_l4.pddl
timeout 60 pyperplan -a ids    src/domain.pddl src/generated/problem_l4.pddl
timeout 60 pyperplan -a astar  -H hmax src/domain.pddl src/generated/problem_l4.pddl
timeout 60 pyperplan -a gbfs   -H hmax src/domain.pddl src/generated/problem_l4.pddl
```

Resultados obtenidos:

| Algoritmo | Tamaño max | Tiempo (s) | Acciones | Óptimo |
|-----------|-----------|------------|----------|--------|
| BFS       | l5        | 23.0       | 18       | Sí     |
| IDS       | l3        | 1.4        | 10       | Sí     |
| A* + hMAX | l4        | 9.5        | 13       | Sí     |
| GBFS + hMAX | l4      | 1.9        | 17       | No     |

## Apartado 2 – Heurísticas satisficing (problema l4)

```bash
timeout 60 pyperplan -a gbfs -H hmax     src/domain.pddl src/generated/problem_l4.pddl
timeout 60 pyperplan -a gbfs -H hadd     src/domain.pddl src/generated/problem_l4.pddl
timeout 60 pyperplan -a gbfs -H hff      src/domain.pddl src/generated/problem_l4.pddl
timeout 60 pyperplan -a gbfs -H landmark src/domain.pddl src/generated/problem_l4.pddl
timeout 60 pyperplan -a ehc  -H hmax     src/domain.pddl src/generated/problem_l4.pddl
timeout 60 pyperplan -a ehc  -H hadd     src/domain.pddl src/generated/problem_l4.pddl
timeout 60 pyperplan -a ehc  -H hff      src/domain.pddl src/generated/problem_l4.pddl
timeout 60 pyperplan -a ehc  -H landmark src/domain.pddl src/generated/problem_l4.pddl
```

| Algoritmo | Heurística | Tiempo (s) | Acciones |
|-----------|-----------|------------|----------|
| GBFS      | hMAX      | 1.9        | 17       |
| GBFS      | hADD      | 0.012      | 15       |
| GBFS      | hFF       | 0.014      | 14       |
| GBFS      | Landmark  | 0.0026     | 16       |
| EHC       | hMAX      | 2.4        | 14       |
| EHC       | hADD      | 0.062      | 13       |
| EHC       | hFF       | 0.023      | 15       |
| EHC       | Landmark  | 0.0065     | 19       |

## Apartado 3 – Planificadores óptimos (problema l4)

Heurísticas admisibles disponibles en pyperplan: **hMAX** y **lmcut**.

```bash
timeout 60 pyperplan -a bfs   src/domain.pddl src/generated/problem_l4.pddl
timeout 60 pyperplan -a ids   src/domain.pddl src/generated/problem_l4.pddl
timeout 60 pyperplan -a astar -H hmax  src/domain.pddl src/generated/problem_l4.pddl
timeout 60 pyperplan -a astar -H lmcut src/domain.pddl src/generated/problem_l4.pddl
```

| Algoritmo | Heurística | Tiempo (s) | Acciones | Óptimo |
|-----------|-----------|------------|----------|--------|
| BFS       | —         | 0.59       | 13       | Sí     |
| IDS       | —         | timeout    | —        | Sí     |
| A*        | hMAX      | 8.9        | 13       | Sí     |
| A*        | lmcut     | 6.1        | 13       | Sí     |

Mejor combinación para solución óptima: **BFS** (más rápido en este tamaño), seguido de **A* + lmcut**.
