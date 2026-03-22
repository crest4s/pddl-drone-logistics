
# Solución Completa – Parte 1: Planificación Clásica con PDDL

## Ejercicio 1.1 – Dominio PDDL

El dominio `drone-domain` define un sistema de reparto de emergencias con un dron que usa dos brazos para transportar cajas.

### Tipos

```pddl
(:types location drone box person content arm - object)
```

### Predicados principales

| Predicado | Descripción |
|-----------|-------------|
| `(at-drone ?d ?l)` | El dron `?d` está en la localización `?l` |
| `(at-box ?b ?l)` | La caja `?b` está en la localización `?l` |
| `(at-person ?p ?l)` | La persona `?p` está en la localización `?l` |
| `(box-content ?b ?c)` | La caja `?b` contiene el tipo `?c` |
| `(has-content ?p ?c)` | La persona `?p` tiene el contenido `?c` |
| `(empty ?a ?d)` | El brazo `?a` del dron `?d` está vacío |
| `(holding ?a ?d ?b)` | El brazo `?a` del dron `?d` lleva la caja `?b` |
| `(available ?b)` | La caja `?b` no ha sido entregada |

### Acciones

- **pick-up**: Recoge caja con brazo libre. Requiere `(empty ?a ?d)` y `(available ?b)`.
- **drop**: Suelta caja en la localización actual. Libera el brazo.
- **deliver**: Entrega caja a persona en la misma localización. Marca `(has-content ?p ?c)` y elimina `(available ?b)`.
- **fly**: Mueve el dron entre cualquier par de localizaciones.

## Ejercicio 1.2 – Generador de problemas

El generador `generate-problem.py` crea problemas PDDL con:
- N localizaciones aleatorias + depósito
- N personas distribuidas en localizaciones aleatorias
- N cajas en el depósito con contenido aleatorio
- N metas de entrega aleatorias (persona, contenido)
- Inicialización de brazos (`arm1`, `arm2`) como vacíos

Uso:
```bash
python3 src/generate-problem.py -d 1 -r 0 -l 10 -p 10 -c 10 -g 10 > src/generated/problem_l10.pddl
```

**Escalabilidad con FF**: resuelve hasta `l40` en ~68 segundos. El tiempo crece aproximadamente de forma exponencial.

## Ejercicio 1.3 – Resultados

### 1.3.1 – Comparativa BFS, IDS, A*, GBFS

BFS y A* garantizan optimalidad. IDS es óptimo pero muy lento (reexpansión). GBFS es el más rápido pero no óptimo.

### 1.3.2 – Heurísticas satisficing

hFF y hADD son las heurísticas más informadas y producen los mejores tiempos. EHC+hADD da el plan más corto (13 acciones en l4).

### 1.3.3 – Heurísticas óptimas

BFS es el más rápido en problemas pequeños. Para problemas más grandes, A*+lmcut escala mejor que A*+hMAX gracias a su mayor poder informativo.
