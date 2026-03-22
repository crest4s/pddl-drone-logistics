# Documentación del Modelado PDDL – Ejercicio 3

## Cambios respecto a la Parte 2.2

### Nuevos requisitos

```pddl
(:requirements :strips :typing :durative-actions :fluents)
```

Se elimina `:action-costs` (no compatible con LPG-TD de la forma usada). Se mantiene `fly-cost` pero ahora como duración de vuelo, no como coste acumulado. Se elimina `total-cost`.

### Nuevos predicados de disponibilidad (mutex)

```pddl
(free-drone ?d - drone)
(free-person ?p - person)
(free-transporter ?t - transporter)
(free-box ?b - box)
```

Estos predicados implementan los mutex de concurrencia: al inicio de cada acción se elimina el predicado `free-*` correspondiente (`at start (not (free-X))`), y al final se restaura (`at end (free-X)`).

### Estructura de una durative-action

```pddl
(:durative-action pick-up
    :parameters (?d - drone ?b - box ?l - location)
    :duration (= ?duration 5)
    :condition (and
        (at start (at-drone ?d ?l))
        (at start (at-box ?b ?l))
        (at start (free-drone ?d))
        (at start (available ?b))
        (at start (free-box ?b))
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

### Semántica temporal

- `at start`: condición/efecto evaluado/aplicado al inicio de la acción.
- `over all`: condición que debe mantenerse durante toda la duración.
- `at end`: condición/efecto evaluado/aplicado al final.

El patrón de mutex es: `at start (not (free-X))` elimina el recurso al inicio, `at end (free-X)` lo libera al final. Esto garantiza que dos acciones que requieran el mismo recurso no puedan solaparse.

## Acción de vuelo

```pddl
(:durative-action move-transporter
    :parameters (?d - drone ?from - location ?to - location ?t - transporter)
    :duration (= ?duration (fly-cost ?from ?to))
    :condition (and
        (at start (at-drone ?d ?from))
        (at start (at-transporter ?t ?from))
        (at start (free-drone ?d))
        (at start (free-transporter ?t))
    )
    :effect (and
        (at start (not (at-drone ?d ?from)))
        (at start (not (at-transporter ?t ?from)))
        (at start (not (free-drone ?d)))
        (at start (not (free-transporter ?t)))
        (at end (at-drone ?d ?to))
        (at end (at-transporter ?t ?to))
        (at end (free-drone ?d))
        (at end (free-transporter ?t))
    )
)
```

La duración es `(fly-cost ?from ?to)`, no un valor fijo. El dron y el transportador se marcan como no disponibles al inicio del vuelo.

## Restricciones de concurrencia implementadas

| Restricción | Predicado usado |
|------------|----------------|
| Un dron, una acción a la vez | `free-drone` |
| Una caja, un dron a la vez | `free-box` |
| Un transportador, un dron a la vez | `free-transporter` |
| Una persona, una entrega a la vez | `free-person` |

## Inicialización en los problemas

Todos los predicados `free-*` deben inicializarse en el problema:

```pddl
(:init
    (free-drone drone1) (free-drone drone2)
    (free-transporter t1) (free-transporter t2)
    (free-person person1) (free-person person2)
    (free-box box1) (free-box box2) ...
)
```
