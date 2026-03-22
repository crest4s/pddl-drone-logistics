# Guía para el Ejercicio 3 – Planificación Temporal con LPG-TD

## Preparación

Instalar LPG-TD (Linux):

```bash
wget http://lpg.unibs.it/lpg/download/lpg-td-1.0.tar.gz
tar xzf lpg-td-1.0.tar.gz
cd lpg-td-1.0 && make
```

## Generar problemas con múltiples drones

```bash
python3 scripts/generate_lpg_problems.py
# genera problemas en src/generated/ con d=1..10, distintos tamaños l
```

O manualmente:

```bash
python3 src/generate-problem.py -d 2 -r 2 -l 5 -p 5 -c 5 -g 5 > src/generated/problem_d2_l5.pddl
```

## Ejecutar LPG-TD

### Modo quality (máxima calidad, tiempo límite 60s)

```bash
timeout 60 ./lpg-td -o src/domain.pddl -f src/generated/problem_d2_l5.pddl \
    -quality -noout -cputime 60
```

### Modo speed (primera solución rápida)

```bash
timeout 60 ./lpg-td -o src/domain.pddl -f src/generated/problem_d2_l5.pddl \
    -speed -noout -cputime 60
```

## Experimento de escalabilidad (quality)

Para cada número de drones d=1..10, encontrar el mayor tamaño l que LPG-TD resuelve en ≤60s.

Resultados obtenidos:

| Drones | Tamaño max (l) | Tiempo (s) | Pasos | Makespan (s) |
|--------|---------------|------------|-------|--------------|
| 1 | 12 | 50.82 | 39 | 2611 |
| 2 | 4  | 14.58 | 13 | 478  |
| 3 | 4  | 36.22 | 12 | 438  |
| 4 | 2  | 5.76  | 6  | 278  |
| 5 | 3  | 49.58 | 10 | 318  |
| 6 | 2  | 34.01 | 7  | 525  |
| 7 | 2  | 31.76 | 6  | 418  |
| 8 | 2  | 10.26 | 11 | 339  |

## Comparativa Quality vs Speed

| Drones | Modo | Tamaño | Tiempo (s) | Pasos | Makespan (s) |
|--------|------|--------|------------|-------|--------------|
| 1 | quality | l12 | 50.82 | 39 | 2611 |
| 1 | speed   | l12 | 53.72 | 39 | 2611 |
| 2 | quality | l4  | 14.58 | 13 | 478  |
| 2 | speed   | l8  | 56.22 | 28 | 1005 |
| 3 | quality | l4  | 36.22 | 12 | 438  |
| 3 | speed   | l5  | 40.14 | 17 | 521  |
| 4 | quality | l2  | 5.76  | 6  | 278  |
| 4 | speed   | l5  | 56.73 | 14 | 624  |

Observación: el modo speed puede resolver problemas más grandes pero con makespan mayor. Para problemas con muchos drones, quality apenas mejora respecto a speed en makespan pero sí empeora en escalabilidad.
