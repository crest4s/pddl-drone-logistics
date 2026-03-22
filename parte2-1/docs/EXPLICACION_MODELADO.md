# Documentación del Modelado PDDL – Ejercicio 2.1

## Cambios respecto al dominio de la Parte 1

### Eliminación de los brazos

Se elimina el tipo `arm` y los predicados `(empty ?a ?d)` y `(holding ?a ?d ?b)`.

En su lugar, el dron tiene un único estado de disponibilidad:

```pddl
(free-drone ?d - drone)   ; el dron no lleva ninguna caja
(holding ?d - drone ?b - box)  ; el dron lleva la caja ?b
```

### Nuevo tipo: transportador

```pddl
(:types
    location drone box person content transporter num - object
)
```

- `transporter`: contenedor que puede llevar hasta 4 cajas.
- `num`: tipo para representar números mediante predicados.

### Nuevos predicados

```pddl
(at-transporter ?t - transporter ?l - location)
(in-transporter ?b - box ?t - transporter)
(siguiente ?n1 ?n2 - num)
(transporter-count ?t - transporter ?n - num)
```

- `(in-transporter ?b ?t)`: la caja `?b` está dentro del transportador `?t`.
- `(siguiente ?n1 ?n2)`: relación de sucesor entre números (se inicializa en el problema).
- `(transporter-count ?t ?n)`: el transportador `?t` contiene actualmente `?n` cajas.

### Inicialización en el problema

```pddl
(:objects n0 n1 n2 n3 n4 - num)
(:init
    (siguiente n0 n1) (siguiente n1 n2) (siguiente n2 n3) (siguiente n3 n4)
    (transporter-count transporter1 n0)
    (= (capacity transporter1) 4)  ; capacidad máxima
)
```

La capacidad máxima se representa implícitamente: al no existir `(siguiente n4 ...)`, la precondición de `load-onto-transporter` no puede satisfacerse cuando el transportador tiene 4 cajas.

## Acciones

### pick-up

```pddl
(:action pick-up
    :parameters (?d - drone ?b - box ?l - location)
    :precondition (and
        (at-drone ?d ?l) (at-box ?b ?l)
        (free-drone ?d) (available ?b)
    )
    :effect (and
        (holding ?d ?b)
        (not (at-box ?b ?l))
        (not (free-drone ?d))
    )
)
```

### load-onto-transporter

Carga la caja que lleva el dron en el transportador. Usa `(siguiente ?actual ?sig)` para incrementar el contador.

```pddl
(:action load-onto-transporter
    :parameters (?d - drone ?b - box ?t - transporter ?l - location ?actual ?sig - num)
    :precondition (and
        (at-drone ?d ?l) (at-transporter ?t ?l)
        (holding ?d ?b)
        (transporter-count ?t ?actual)
        (siguiente ?actual ?sig)
    )
    :effect (and
        (in-transporter ?b ?t)
        (free-drone ?d)
        (not (holding ?d ?b))
        (transporter-count ?t ?sig)
        (not (transporter-count ?t ?actual))
    )
)
```

### unload-from-transporter

Saca una caja del transportador al dron. Usa `(siguiente ?anterior ?actual)` para decrementar.

```pddl
(:action unload-from-transporter
    :parameters (?d - drone ?b - box ?t - transporter ?l - location ?anterior ?actual - num)
    :precondition (and
        (at-drone ?d ?l) (at-transporter ?t ?l)
        (in-transporter ?b ?t)
        (transporter-count ?t ?actual)
        (siguiente ?anterior ?actual)
        (free-drone ?d)
    )
    :effect (and
        (not (in-transporter ?b ?t))
        (holding ?d ?b)
        (not (free-drone ?d))
        (transporter-count ?t ?anterior)
        (not (transporter-count ?t ?actual))
    )
)
```

### move-transporter

Mueve el dron y el transportador juntos a otra localización.

```pddl
(:action move-transporter
    :parameters (?d - drone ?from - location ?to - location ?t - transporter)
    :precondition (and
        (at-drone ?d ?from)
        (at-transporter ?t ?from)
        (free-drone ?d)
    )
    :effect (and
        (at-drone ?d ?to) (not (at-drone ?d ?from))
        (at-transporter ?t ?to) (not (at-transporter ?t ?from))
    )
)
```

## Por qué se usa `siguiente` en lugar de fluents numéricos

Muchos planificadores (especialmente los usados en la Parte 1) no soportan `:numeric-fluents`. La representación mediante predicados y el tipo `num` es compatible con STRIPS puro y todos los planificadores de la práctica.
