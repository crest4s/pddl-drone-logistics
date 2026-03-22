# Documentación del Modelado PDDL – Ejercicio 1.1

## Tipos definidos

```pddl
(:types
    location drone box person content arm - object
)
```

- `location`: localizaciones del mapa, incluyendo el depósito.
- `drone`: el dron repartidor.
- `box`: cajas de suministros.
- `person`: personas que necesitan recibir suministros.
- `content`: tipos de contenido (p.ej. `food`, `medicine`).
- `arm`: los dos brazos del dron (objetos `arm1`, `arm2` en los problemas).

## Predicados

```pddl
(:predicates
    (at-drone ?d - drone ?l - location)
    (at-box ?b - box ?l - location)
    (at-person ?p - person ?l - location)
    (box-content ?b - box ?c - content)
    (has-content ?p - person ?c - content)
    (empty ?a - arm ?d - drone)
    (holding ?a - arm ?d - drone ?b - box)
    (available ?b - box)
)
```

### Modelado de los brazos del dron

Los brazos se representan como objetos del tipo `arm`. Los predicados `(empty ?a ?d)` y `(holding ?a ?d ?b)` están parametrizados por el brazo, por lo que un único par de predicados modela ambos brazos sin necesidad de cuatro predicados separados.

Para coger una caja, el brazo utilizado debe satisfacer `(empty ?a ?d)`. Una vez que ambos brazos están ocupados (`(holding arm1 drone1 ...)` y `(holding arm2 drone1 ...)`), ninguna acción pick-up puede ejecutarse, garantizando el límite de dos cajas sin precondiciones negativas.

### Predicado `available`

Se inicializa para todas las cajas. Se elimina al entregar una caja (`(not (available ?b))`). Esto impide que el dron vuelva a recoger una caja ya entregada.

### Representación genérica del contenido

El tipo `content` permite añadir nuevos tipos de contenido (agua, herramientas, etc.) desde el fichero de problema sin tocar el dominio.

## Acciones

### pick-up

Recoge una caja con un brazo libre.

```pddl
(:action pick-up
    :parameters (?d - drone ?b - box ?l - location ?a - arm)
    :precondition (and
        (at-drone ?d ?l)
        (at-box ?b ?l)
        (empty ?a ?d)
        (available ?b)
    )
    :effect (and
        (holding ?a ?d ?b)
        (not (at-box ?b ?l))
        (not (empty ?a ?d))
    )
)
```

### drop

Suelta una caja en la localización actual y libera el brazo.

```pddl
(:action drop
    :parameters (?d - drone ?b - box ?l - location ?a - arm)
    :precondition (and
        (holding ?a ?d ?b)
        (at-drone ?d ?l)
    )
    :effect (and
        (at-box ?b ?l)
        (empty ?a ?d)
        (not (holding ?a ?d ?b))
    )
)
```

### deliver

Entrega una caja directamente a una persona en la misma localización.

```pddl
(:action deliver
    :parameters (?d - drone ?p - person ?b - box ?l - location ?a - arm ?c - content)
    :precondition (and
        (at-drone ?d ?l)
        (at-person ?p ?l)
        (holding ?a ?d ?b)
        (box-content ?b ?c)
        (available ?b)
    )
    :effect (and
        (has-content ?p ?c)
        (empty ?a ?d)
        (not (holding ?a ?d ?b))
        (at-box ?b ?l)
        (not (available ?b))
    )
)
```

### fly

Mueve el dron de una localización a otra sin restricciones de ruta.

```pddl
(:action fly
    :parameters (?d - drone ?from - location ?to - location)
    :precondition (and (at-drone ?d ?from))
    :effect (and
        (at-drone ?d ?to)
        (not (at-drone ?d ?from))
    )
)
```

## Por qué no se usan precondiciones negativas

STRIPS puro no permite precondiciones negativas. Las condiciones de "brazo libre" y "caja no entregada" se modelan con predicados positivos (`empty` y `available`), siendo éstos los que se eliminan en los efectos cuando corresponde.
