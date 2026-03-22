# Resumen Ejecutivo – Parte 1: Planificación Clásica con PDDL

## Ejercicio 1.1 – Dominio y problemas

- **Dominio**: `src/domain.pddl` — STRIPS con `:typing`. Tipos: `location`, `drone`, `box`, `person`, `content`, `arm`. 4 acciones: `pick-up`, `drop`, `deliver`, `fly`.
- **problem1.pddl**: 1 dron, 1 persona, 1 caja, 1 meta.
- **problem2.pddl**: 1 dron, 2 personas, 3 cajas, 2 metas.

Decisión clave: brazos modelados como objetos `arm` con predicados parametrizados `(empty ?a ?d)` y `(holding ?a ?d ?b)`.

## Ejercicio 1.2 – Generador y escalabilidad con FF

- **Generador**: `src/generate-problem.py` — genera problemas aleatorios con parámetros `-d -r -l -p -c -g`.
- **Planificador FF**: resuelve hasta tamaño `l40` en menos de 1 minuto (~68s).
- Crecimiento del tiempo aproximadamente exponencial a partir de `l20`.

| Tamaño | Tiempo (s) | Acciones |
|--------|-----------|----------|
| l10    | 0.074     | 34       |
| l20    | 0.909     | 70       |
| l30    | 5.048     | 102      |
| l39    | 27.932    | 136      |
| l40    | 67.865    | 148      |

## Ejercicio 1.3 – Comparativa de algoritmos y heurísticas

### Tamaño máximo resuelto en 1 minuto

| Algoritmo    | Tamaño | Tiempo (s) | Óptimo |
|-------------|--------|------------|--------|
| BFS         | l5     | 23.0       | Sí     |
| IDS         | l3     | 1.4        | Sí     |
| A* + hMAX   | l4     | 9.5        | Sí     |
| GBFS + hMAX | l4     | 1.9        | No     |

### Mejor combinación para solución óptima (problema l4)

BFS resulta más rápido que A* en este tamaño. A* + lmcut es la mejor opción cuando el problema es mayor.

## Archivos del directorio

```
parte1/
├── src/
│   ├── domain.pddl
│   ├── problem1.pddl
│   ├── problem2.pddl
│   ├── generate-problem.py
│   └── generated/   (problemas generados)
├── docs/
│   ├── enunciado.md
│   ├── EXPLICACION_MODELADO.md    (este fichero)
│   ├── GUIA_EJERCICIO_1.3.md
│   ├── HEURISTICAS_TEORIA.md
│   ├── RESUMEN_EJECUTIVO.md
│   └── SOLUCION_COMPLETA.md
└── scripts/
    └── run_experiments.sh
```
