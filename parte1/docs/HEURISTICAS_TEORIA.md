# Información Teórica: Algoritmos y Heurísticas de Planificación (Parte 1)

## Algoritmos de Búsqueda

### BFS (Breadth-First Search)

Explora el espacio de búsqueda por niveles (anchura). Garantiza encontrar la solución óptima (menor número de acciones) si el coste de cada acción es unitario. El consumo de memoria crece exponencialmente con la profundidad de la solución.

### IDS (Iterative Deepening Search)

Combina las ventajas de BFS (optimalidad) y DFS (bajo consumo de memoria). Realiza búsquedas en profundidad con límite creciente. Más lento que BFS en la práctica por la reexpansión de nodos.

### A* (A-estrella)

Búsqueda informada que combina el coste acumulado `g(n)` con una estimación heurística `h(n)`. Con una heurística admisible (no sobreestima), garantiza optimalidad. Es el algoritmo de referencia para planificación óptima.

### GBFS (Greedy Best-First Search)

Solo usa la heurística `h(n)`, ignorando el coste acumulado. Muy rápido en encontrar una solución, pero no garantiza optimalidad. Útil para planificación satisficing.

### EHC (Enforced Hill Climbing)

Variante de búsqueda local que, al quedar atrapada en un mínimo local, realiza una búsqueda en anchura hasta encontrar un estado con mejor valor heurístico. Muy eficiente en práctica, pero incompleto en algunos dominios.

## Heurísticas

### hMAX (admisible)

Calcula el grafo de planificación relajado y toma el máximo coste individual entre todos los hechos meta. Nunca sobreestima, por lo que es admisible. Menos informada que lmcut, pero más barata de calcular.

### lmcut (admisible)

Extrae cortes del grafo de planificación relajado (landmarks). Más informada que hMAX, lo que reduce el número de nodos expandidos en A*. Garantiza admisibilidad.

### hADD (no admisible)

Suma los costes relajados de todos los hechos meta. Sobreestima el coste real, por lo que no es admisible. Muy informada para planificación satisficing.

### hFF (no admisible)

Extrae un plan relajado del grafo de planificación relajado y cuenta sus acciones. Heurística del planificador FF. No admisible pero muy efectiva en práctica.

### Landmark (no admisible)

Basada en hechos o acciones que deben ocurrir en todo plan válido (landmarks). No es admisible en todas las implementaciones, pero guía bien la búsqueda.

## Relación con el planificador FF

FF utiliza internamente EHC con hFF como estrategia principal. Cuando EHC queda atrapado, FF recurre a GBFS con hFF como búsqueda de rescate. Esta combinación es muy eficiente en dominios STRIPS.
