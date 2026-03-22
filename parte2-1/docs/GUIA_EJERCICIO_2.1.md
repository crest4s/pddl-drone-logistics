# Guía para el Ejercicio 2.1 – Transportadores y Números

## Cambios en el generador

El generador `generate-problem.py` de la Parte 2.1 añade respecto al de la Parte 1:

1. **Tipo `num`** con objetos `n0 n1 n2 n3 n4`.
2. **Relaciones `siguiente`**: `(siguiente n0 n1)`, ..., `(siguiente n3 n4)`.
3. **Transportadores**: uno por dron, inicializados en el depósito.
4. **Estado inicial del transportador**: `(transporter-count t1 n0)`.
5. **Predicado `free-drone`** en lugar de brazos.

Uso del generador:

```bash
python3 src/generate-problem.py -d 1 -r 1 -l 5 -p 5 -c 5 -g 5 > src/generated/problem_l5.pddl
```

El parámetro `-r` ahora especifica el número de transportadores (usar `-r 1`).

## Verificación del dominio

Probar con un problema pequeño:

```bash
ff -o src/domain.pddl -f src/generated/problem_l2.pddl
```

El plan debe incluir las acciones `load-onto-transporter`, `move-transporter`, `unload-from-transporter`, `deliver`.

## Repetición de experimentos 1.3.2 y 1.3.3

Adaptar el problema usado en la Parte 1 (añadir transportador y valores numéricos):

```bash
timeout 60 pyperplan -a gbfs -H hff  src/domain.pddl src/generated/problem_l4.pddl
timeout 60 pyperplan -a ehc  -H hff  src/domain.pddl src/generated/problem_l4.pddl
timeout 60 pyperplan -a astar -H hmax src/domain.pddl src/generated/problem_l4.pddl
timeout 60 pyperplan -a astar -H lmcut src/domain.pddl src/generated/problem_l4.pddl
```

## Comparativa con dominio de brazos

El dominio de transportadores tiene más acciones por entrega (pick-up → load → move → unload → deliver), lo que puede dar planes más largos en número de acciones pero más eficientes en términos de viajes.
