# Resumen Ejecutivo – Parte 2.1: Transportadores

## Cambios implementados

1. **Dominio**: se eliminan los brazos (`arm`). Se añaden `transporter` y `num` como tipos. Nuevos predicados: `free-drone`, `at-transporter`, `in-transporter`, `siguiente`, `transporter-count`. Nuevas acciones: `load-onto-transporter`, `unload-from-transporter`, `move-transporter`.

2. **Generador**: actualizado para incluir transportadores (1 por dron, en el depósito), tipo `num` con objetos n0–n4, relaciones `siguiente`, inicialización de `transporter-count` a n0.

## Archivos del directorio

```
parte2-1/
├── src/
│   ├── domain.pddl         (dominio con transportadores, sin costes)
│   ├── problem1.pddl
│   ├── problem2.pddl
│   ├── generate-problem.py
│   └── generated/
├── docs/
│   ├── enunciado.md
│   ├── EXPLICACION_MODELADO.md
│   ├── GUIA_EJERCICIO_2.1.md
│   ├── COMPARATIVA_DOMINIOS.md
│   ├── RESUMEN_EJECUTIVO.md
│   └── SOLUCION_COMPLETA.md
└── scripts/
    └── run_experiments.sh
```

## Resultados clave

- El dominio de transportadores permite repartir 4 cajas en un único viaje.
- El número de acciones por plan aumenta ligeramente, pero el número de vuelos disminuye.
- Los tiempos de pyperplan son comparables a los del dominio de brazos en problemas pequeños.
