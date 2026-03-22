# Solución Completa – Parte 3: Planificación con Concurrencia

## Dominio temporal

El dominio `drone-domain` de la Parte 3 convierte todas las acciones a `durative-actions` para permitir planes paralelos.

### Predicados de mutex

```pddl
(free-drone ?d - drone)
(free-person ?p - person)
(free-transporter ?t - transporter)
(free-box ?b - box)
```

Cada acción reserva los recursos que necesita `at start` y los libera `at end`.

### Ejemplo: pick-up

```pddl
(:durative-action pick-up
    :parameters (?d - drone ?b - box ?l - location)
    :duration (= ?duration 5)
    :condition (and
        (at start (free-drone ?d))
        (at start (free-box ?b))
        (at start (at-drone ?d ?l))
        (at start (at-box ?b ?l))
        (at start (available ?b))
        (over all (at-drone ?d ?l))
    )
    :effect (and
        (at start (not (free-drone ?d)))
        (at start (not (free-box ?b)))
        (at end (holding ?d ?b))
        (at end (not (at-box ?b ?l)))
        (at end (free-drone ?d))
        (at end (free-box ?b))
    )
)
```

### Ejemplo: move-transporter (vuelo)

```pddl
(:durative-action move-transporter
    :parameters (?d - drone ?from - location ?to - location ?t - transporter)
    :duration (= ?duration (fly-cost ?from ?to))
    :condition (and
        (at start (free-drone ?d))
        (at start (free-transporter ?t))
        (at start (at-drone ?d ?from))
        (at start (at-transporter ?t ?from))
    )
    :effect (and
        (at start (not (free-drone ?d)))
        (at start (not (free-transporter ?t)))
        (at start (not (at-drone ?d ?from)))
        (at start (not (at-transporter ?t ?from)))
        (at end (at-drone ?d ?to))
        (at end (at-transporter ?t ?to))
        (at end (free-drone ?d))
        (at end (free-transporter ?t))
    )
)
```

## Verificación de concurrencia

LPG-TD genera planes en formato temporal donde cada acción tiene un tiempo de inicio. Con múltiples drones:

```
0.000: (move-transporter drone1 depot loc1 t1)  [duration: 15]
0.000: (move-transporter drone2 depot loc2 t2)  [duration: 22]
15.001: (unload-from-transporter drone1 ...)     [duration: 5]
22.001: (unload-from-transporter drone2 ...)     [duration: 5]
```

Dos drones vuelan en paralelo porque usan recursos distintos (`free-drone drone1` vs `free-drone drone2`).

## Análisis Quality vs Speed

- **Quality**: LPG-TD optimiza el makespan iterativamente. Produce planes con menor duración total pero escala peor (resuelve problemas más pequeños en 1 minuto).
- **Speed**: LPG-TD devuelve la primera solución válida. Resuelve problemas más grandes pero el makespan puede ser mayor.

En el dominio de drones, la diferencia de makespan entre quality y speed es moderada para pocos drones (1-3), y se reduce a medida que aumenta el número de drones (el paralelismo ya acorta naturalmente el makespan).
