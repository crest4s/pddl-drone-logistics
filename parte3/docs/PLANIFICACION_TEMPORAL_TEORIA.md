# Teoría: Planificación Temporal y LPG-TD

## Planificación Temporal (PDDL 2.1)

La planificación temporal extiende STRIPS permitiendo que las acciones tengan duración. Las acciones durativas (`durative-actions`) tienen:

- **Condiciones** evaluadas en instantes específicos:
  - `at start`: al comienzo de la acción.
  - `over all`: durante toda la ejecución.
  - `at end`: al finalizar la acción.
- **Efectos** aplicados en instantes específicos: `at start` o `at end`.
- **Duración**: fija o dependiente de un fluent.

Esto permite planes **paralelos** donde varias acciones se solapan temporalmente, siempre que no violen ninguna condición.

## Restricciones de Mutex

En planificación temporal, es necesario modelar explícitamente qué recursos no pueden ser usados simultáneamente. Esto se hace con predicados de disponibilidad:

- Un recurso `X` está disponible → `(free-X ...)`
- Al inicio de una acción que usa `X`: `at start (not (free-X))` — reserva el recurso.
- Al final de la acción: `at end (free-X)` — libera el recurso.

Si dos acciones requieren el mismo `free-X`, el planificador no puede solaparlas (la segunda tiene que esperar a que la primera libere el recurso).

## LPG-TD (Local search Planning Graph - Temporal and Derived)

LPG-TD es un planificador temporal desarrollado por la Universidad de Brescia. Se basa en:

1. **Grafo de planificación**: estructura que representa posibles acciones y hechos en cada nivel temporal.
2. **Búsqueda local**: parte de un plan aleatorio y aplica operaciones locales para eliminar inconsistencias (acciones que violan precondiciones o efectos conflictivos).
3. **Función de evaluación**: mide la calidad del plan parcial en base a inconsistencias y makespan.

### Modos de operación

- **quality**: LPG-TD busca la mejor solución posible en el tiempo dado, mejorando iterativamente la calidad (makespan mínimo).
- **speed**: LPG-TD devuelve la primera solución que encuentra, priorizando velocidad sobre calidad.

### Makespan vs. Pasos

- **Pasos (steps)**: número total de acciones en el plan.
- **Makespan**: duración total del plan (tiempo desde la primera acción hasta la última).

En planificación temporal, el makespan importa más que el número de pasos, ya que las acciones se solapan.

## Paralelismo en el dominio de drones

Con múltiples drones y transportadores, el planificador puede:
- Varios drones volando simultáneamente a diferentes localizaciones.
- Un dron cargando el transportador mientras otro vuela.
- Entregas simultáneas a personas distintas (diferentes predicados `free-person`).

El makespan mejora con más drones porque más acciones se ejecutan en paralelo, hasta el límite impuesto por los mutex.
