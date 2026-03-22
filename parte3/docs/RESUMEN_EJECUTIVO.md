# Resumen Ejecutivo – Parte 3: Planificación con Concurrencia

## Cambios implementados

1. **Dominio** (`parte3/src/domain.pddl`):
   - Requisitos: `:durative-actions :fluents` (se elimina `:action-costs`).
   - Se mantiene `fly-cost` como fluent para la duración del vuelo.
   - Se eliminan `total-cost` y brazos.
   - Nuevos predicados: `free-person`, `free-transporter`, `free-box` (además de `free-drone`).
   - Todas las acciones son `durative-actions` con duración 5s (no-vuelo) o `(fly-cost ?from ?to)` (vuelo).

2. **Generador** (`parte3/scripts/generate_lpg_problems.py`):
   - Genera problemas con d=1..10 drones y tamaños l=2..30.
   - Inicializa predicados `free-*` para todos los objetos.

## Resultados clave

### Escalabilidad en modo quality (mayor tamaño resuelto en ≤1 min)

| Drones | Tamaño | Makespan (s) |
|--------|--------|--------------|
| 1  | l12 | 2611 |
| 2  | l4  | 478  |
| 3  | l4  | 438  |
| 4  | l2  | 278  |
| 5  | l3  | 318  |
| 8  | l2  | 339  |

### Quality vs Speed

Speed resuelve problemas más grandes que quality. El makespan de quality es menor o igual al de speed en los mismos problemas, pero la diferencia no es siempre significativa.

## Archivos del directorio

```
parte3/
├── src/
│   ├── domain.pddl         (dominio temporal con durative-actions)
│   ├── problem1.pddl
│   ├── problem2.pddl
│   ├── generate-problem.py
│   └── generated/          (130 problemas PDDL)
├── docs/
│   ├── enunciado.md
│   ├── EXPLICACION_MODELADO.md
│   ├── GUIA_EJERCICIO_3.md
│   ├── PLANIFICACION_TEMPORAL_TEORIA.md
│   ├── RESUMEN_EJECUTIVO.md
│   └── SOLUCION_COMPLETA.md
└── scripts/
    ├── generate_lpg_problems.py
    └── run_lpg_experiments.py
```
