# Resumen Ejecutivo – Parte 2.2: Costes de Acción

## Cambios implementados

1. **Dominio** (`parte2-2/src/domain.pddl`): añadido `:action-costs`, funciones `(total-cost)` y `(fly-cost ?from ?to)`. Cada acción tiene `(increase (total-cost) ...)`. El vuelo usa `(fly-cost ?from ?to)` como coste variable.

2. **Generador**: inicializa `(= (total-cost) 0)`, calcula y vuelca todos los `(= (fly-cost locA locB) N)`, y añade `(:metric minimize (total-cost))`.

## Resultados clave

### Satisficing (1 min, 1 dron, 1 transportador)

| Planificador | Tamaño | Tiempo (s) | Acciones |
|-------------|--------|------------|----------|
| FD lama-first | l74 | 52.28 | 444 |
| FD seq-sat-fdss-2 | l5 | 46.09 | 26 |
| FD seq-sat-autotune-2 | l255 | 59.83 | — |

`seq-sat-autotune-2` resuelve problemas mucho más grandes que los demás, pero la calidad de solución (coste) puede ser peor.

### Óptimos

Los planificadores óptimos se limitan a problemas pequeños (l5–l15 aproximadamente) por la complejidad de garantizar optimalidad con costes de vuelo variables.

## Archivos del directorio

```
parte2-2/
├── src/
│   ├── domain.pddl         (dominio con costes)
│   ├── problem1.pddl
│   ├── problem2.pddl
│   ├── generate-problem.py
│   └── generated/
├── docs/
│   ├── enunciado.md
│   ├── EXPLICACION_MODELADO.md
│   ├── GUIA_EJERCICIO_2.2.md
│   ├── PLANIFICADORES_FD_TEORIA.md
│   ├── RESUMEN_EJECUTIVO.md
│   └── SOLUCION_COMPLETA.md
└── scripts/
    └── run_experiments.sh
```
