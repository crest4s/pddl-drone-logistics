# Documentación del Modelado PDDL – Ejercicio 2.2

## Cambios respecto a la Parte 2.1

### Nuevos requisitos

```pddl
(:requirements :strips :typing :action-costs)
```

`:action-costs` habilita la función especial `total-cost` y la semántica de minimización.

### Nuevas funciones

```pddl
(:functions
    (total-cost) - number
    (fly-cost ?from ?to - location) - number
)
```

- `total-cost`: coste acumulado del plan. Se inicializa a 0 en el problema y se minimiza como métrica.
- `fly-cost`: coste de volar entre dos localizaciones concretas. Se inicializa en el problema con valores generados por `flight_cost()`.

### Costes por acción

| Acción | Coste |
|--------|-------|
| pick-up | 1 |
| drop | 1 |
| deliver | 1 |
| load-onto-transporter | 1 |
| unload-from-transporter | 1 |
| move-transporter | `(fly-cost ?from ?to)` |

Las acciones de manipulación de cajas tienen coste 1 (fijo). El vuelo tiene un coste variable proporcional a la distancia, lo que incentiva al planificador a minimizar los viajes largos y agrupar entregas.

### Efecto en acciones de vuelo

```pddl
(:action move-transporter
    ...
    :effect (and
        ...
        (increase (total-cost) (fly-cost ?from ?to))
    )
)
```

### Inicialización en el problema

```pddl
(:init
    (= (total-cost) 0)
    (= (fly-cost depot loc1) 15)
    (= (fly-cost depot loc2) 22)
    (= (fly-cost loc1 loc2) 8)
    ...
)
(:metric minimize (total-cost))
```

Los valores de `fly-cost` son simétricos y generados aleatoriamente por el generador (enteros positivos).

## Por qué los costes son necesarios

Sin costes, el planificador puede preferir hacer muchos viajes individuales (uno por caja) en lugar de agrupar cargas. Al asignar un coste alto al vuelo, el planificador aprende que es más barato cargar varias cajas y volar una sola vez.
