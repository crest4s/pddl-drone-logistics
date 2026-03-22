# Solución Completa – Parte 2.2: Costes de Acción

## Dominio con costes

El dominio de la Parte 2.2 extiende el de la Parte 2.1 añadiendo `:action-costs`.

### Requisitos

```pddl
(:requirements :strips :typing :action-costs)
```

### Funciones

```pddl
(:functions
    (total-cost) - number
    (fly-cost ?from ?to - location) - number
)
```

### Ejemplo de acción con coste fijo

```pddl
(:action pick-up
    ...
    :effect (and
        ...
        (increase (total-cost) 1)
    )
)
```

### Acción de vuelo con coste variable

```pddl
(:action move-transporter
    ...
    :effect (and
        (at-drone ?d ?to) (not (at-drone ?d ?from))
        (at-transporter ?t ?to) (not (at-transporter ?t ?from))
        (increase (total-cost) (fly-cost ?from ?to))
    )
)
```

## Generador

Fragmento de inicialización generado por `generate-problem.py`:

```pddl
(:init
    (= (total-cost) 0)
    (= (fly-cost depot loc1) 18)
    (= (fly-cost depot loc2) 25)
    (= (fly-cost loc1 loc2) 11)
    ...
)
(:metric minimize (total-cost))
```

## Análisis de planificadores

### Satisficing

- **lama-first** es el más robusto: escala hasta l74 en 1 minuto con buena calidad de solución.
- **seq-sat-autotune-2** escala más (hasta l255), pero puede dar soluciones de peor calidad.
- **seq-sat-fdss-2** es conservador: resuelve solo hasta l5 pero con menor coste.

### Óptimos

- **seq-opt-lmcut** es el más informado y generalmente el más rápido entre los óptimos.
- **seq-opt-bjolp** y **seq-opt-fdss2** son alternativos; su rendimiento depende del dominio.
- Todos los óptimos se quedan en tamaños pequeños por la complejidad de `:action-costs` con costes variables.

## Conclusión

El uso de costes permite que el planificador aprenda a agrupar entregas y minimizar vuelos largos. Para uso práctico, `lama-first` ofrece el mejor equilibrio entre escalabilidad y calidad de solución.
