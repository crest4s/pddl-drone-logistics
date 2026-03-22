# Guía para el Ejercicio 2.2 – Costes de Acción

## Preparación

### Planificadores satisficing

**Metric-FF**:
```bash
./metric-ff -o src/domain.pddl -f src/generated/problem_l5.pddl
```

**Fast Downward**:
```bash
./fast-downward.py src/domain.pddl src/generated/problem_l5.pddl --search "lazy_greedy([ff()], preferred=[ff()])"  # lama-first equivalente
./fast-downward.py --alias lama-first          src/domain.pddl src/generated/problem_l5.pddl
./fast-downward.py --alias seq-sat-fdss-2      src/domain.pddl src/generated/problem_l5.pddl
./fast-downward.py --alias seq-sat-fd-autotune-2 src/domain.pddl src/generated/problem_l5.pddl
```

### Planificadores óptimos

```bash
./fast-downward.py --alias seq-opt-lmcut  src/domain.pddl src/generated/problem_l5.pddl
./fast-downward.py --alias seq-opt-bjolp  src/domain.pddl src/generated/problem_l5.pddl
./fast-downward.py --alias seq-opt-fdss2  src/domain.pddl src/generated/problem_l5.pddl
```

## Resultados obtenidos

### Planificadores satisficing (1 dron, 1 transportador, cap. 4)

| Planificador | Tamaño max | Tiempo (s) | Acciones | Coste |
|-------------|-----------|------------|----------|-------|
| FD lama-first | l74 | 52.28 | 444 | 24240 |
| FD seq-sat-fdss-2 | l5 | 46.09 | 26 | 662 |
| FD seq-sat-autotune-2 | l255 | 59.83 | — | — |

### Planificadores óptimos

Los planificadores óptimos escalan peor. Investigar el tamaño máximo resuelto en 1 minuto para cada alias.

## Sobre los planificadores

- **lama-first**: combina landmarks y hFF en una búsqueda de escalada anytime. Muy efectivo en dominios de logística.
- **seq-sat-fdss-2**: portfolio de configuraciones satisficing. Más conservador.
- **seq-sat-fd-autotune-2**: portfolio autoajustado. Muy agresivo en tamaño.
- **seq-opt-lmcut**: A* con heurística lmcut. Óptimo, pero escala peor.
- **seq-opt-bjolp**: A* con heurística de conjunción de landmarks. Óptimo.
- **seq-opt-fdss2**: portfolio de configuraciones óptimas.
