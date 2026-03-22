# Teoría: Planificadores Fast Downward

## Fast Downward (FD)

Fast Downward es un planificador de propósito general desarrollado por la Universidad de Stuttgart. Trabaja con una representación interna SAS+ (variables de dominio finito) obtenida mediante traducción del PDDL.

## Planificadores Satisficing

### lama-first

LAMA (Landmark-Based Multi-Anytime) combina:
- **Heurística de landmarks**: identifica hechos o acciones que deben aparecer en todo plan válido.
- **Heurística hFF**: estimación basada en plan relajado.
- **Búsqueda iterada**: mejora progresivamente la solución encontrada.

`lama-first` devuelve la primera solución encontrada (no espera a mejorar). Muy eficaz en dominios de logística con costes.

### seq-sat-fdss-2

Portfolio de 5 configuraciones satisficing ejecutadas en paralelo o secuencia. Cada configuración usa distintas heurísticas y algoritmos de búsqueda. Más conservador en memoria que lama-first.

### seq-sat-fd-autotune-2

Portfolio autoajustado mediante técnicas de aprendizaje automático offline (configurado con SATenstein). Puede escalar a problemas muy grandes pero con menos garantías de calidad de solución.

## Planificadores Óptimos

### seq-opt-lmcut

A* con la heurística **LM-cut** (Landmark Cut). LM-cut extrae cortes del grafo de planificación relajado que corresponden a conjuntos de acciones que deben aparecer en el plan óptimo. Es la heurística óptima más informada disponible en FD para dominios de coste.

### seq-opt-bjolp

A* con la heurística **BJOLP** (Conjunctive Landmarks). Usa la unión de múltiples landmarks como cota inferior. Menos informada que lmcut en algunos dominios, pero más rápida de calcular.

### seq-opt-fdss2

Portfolio de 2 configuraciones óptimas. Divide el tiempo disponible entre `lmcut` y `bjolp`. Útil cuando se desconoce cuál de los dos será mejor para el problema concreto.

## Comparativa satisficing vs. óptimo

Los planificadores satisficing escalan mucho mejor (resuelven problemas mucho más grandes), pero no garantizan minimizar el coste. Los óptimos garantizan el plan de coste mínimo pero su complejidad es exponencial en el peor caso.

Para el dominio de drones con costes de vuelo, `lama-first` suele encontrar soluciones de buena calidad muy rápidamente, mientras que `seq-opt-lmcut` solo es viable para problemas pequeños.
