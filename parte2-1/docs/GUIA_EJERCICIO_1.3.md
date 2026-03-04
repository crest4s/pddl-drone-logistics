# Guía para el Ejercicio 1.3: Comparativa de Rendimiento

## Preparación

### 1. Instalación de pyperplan
```bash
pip install pyperplan
# o
git clone https://github.com/aibasel/pyperplan.git
cd pyperplan
python setup.py install
```

### 2. Verificar disponibilidad de planificadores
- **FF**: Descargar de https://fai.cs.uni-saarland.de/hoffmann/ff.html
- **pyperplan**: Ya instalado

---

## Ejercicio 1.3.1: Comparativa Algoritmos de Búsqueda

### Algoritmos a probar:
- **BFS** (Breadth First Search): Búsqueda no informada, óptima
- **IDS** (Iterative Deepening Search): Búsqueda no informada, óptima
- **A*** con hMAX: Búsqueda informada, óptima (si la heurística es admisible)
- **GBFS** (Greedy Best First Search) con hMAX: Búsqueda informada, no óptima

### Comandos pyperplan:
```bash
# BFS
pyperplan -s bfs domain.pddl problem.pddl

# IDS
pyperplan -s ids domain.pddl problem.pddl

# A* con hMAX
pyperplan -s astar -H hmax domain.pddl problem.pddl

# GBFS con hMAX
pyperplan -s gbfs -H hmax domain.pddl problem.pddl
```

### Métricas a registrar:
1. **Tamaño del problema**: Parámetros -l, -p, -c, -g
2. **Tiempo de resolución**: Tiempo en segundos
3. **Longitud del plan**: Número de acciones
4. **Optimalidad**: ¿Es óptimo el plan? (BFS, IDS, A* sí; GBFS no garantiza)
5. **Nodos expandidos**: Información de búsqueda
6. **Memoria usada**: Si es relevante

### Tabla esperada:

| Algoritmo | Tamaño | Tiempo (s) | Acciones | Óptimo | Max resuelto en 60s |
|-----------|--------|------------|----------|--------|---------------------|
| BFS       | ...    | ...        | ...      | Sí     | ...                 |
| IDS       | ...    | ...        | ...      | Sí     | ...                 |
| A*+hMAX   | ...    | ...        | ...      | Sí     | ...                 |
| GBFS+hMAX | ...    | ...        | ...      | No     | ...                 |

---

## Ejercicio 1.3.2: Heurísticas para Planificadores Satisficing

### Diferencias entre GBFS y EHC:

**GBFS (Greedy Best First Search)**:
- Búsqueda best-first que expande siempre el nodo con mejor valor heurístico
- No garantiza optimalidad
- Puede quedar atrapado en mínimos locales
- Explora más ampliamente el espacio de estados

**EHC (Enforced Hill Climbing)**:
- Hace hill climbing: avanza solo si mejora la heurística
- Si se queda atascado, hace búsqueda BFS hasta encontrar un estado mejor
- Más rápido en problemas donde la heurística guía bien
- Más eficiente en memoria

**Uso en FF**:
El planificador FF usa una estrategia híbrida:
1. Primero intenta EHC con heurística hFF (rápido, busca soluciones)
2. Si EHC falla, cambia a GBFS con hFF (más robusto)

### Comandos:
```bash
# GBFS con diferentes heurísticas
pyperplan -s gbfs -H hmax domain.pddl problem.pddl
pyperplan -s gbfs -H hadd domain.pddl problem.pddl
pyperplan -s gbfs -H hff domain.pddl problem.pddl
pyperplan -s gbfs -H landmark domain.pddl problem.pddl

# EHC con diferentes heurísticas
pyperplan -s ehc -H hmax domain.pddl problem.pddl
pyperplan -s ehc -H hadd domain.pddl problem.pddl
pyperplan -s ehc -H hff domain.pddl problem.pddl
pyperplan -s ehc -H landmark domain.pddl problem.pddl
```

### Tabla esperada:

| Algoritmo | Heurística | Tiempo (s) | Acciones | Observaciones |
|-----------|------------|------------|----------|---------------|
| GBFS      | hMAX       | ...        | ...      | ...           |
| GBFS      | hADD       | ...        | ...      | ...           |
| GBFS      | hFF        | ...        | ...      | ...           |
| GBFS      | Landmark   | ...        | ...      | ...           |
| EHC       | hMAX       | ...        | ...      | ...           |
| EHC       | hADD       | ...        | ...      | ...           |
| EHC       | hFF        | ...        | ...      | ...           |
| EHC       | Landmark   | ...        | ...      | ...           |

---

## Ejercicio 1.3.3: Heurísticas para Planificadores Óptimos

### Heurísticas Admisibles en pyperplan:

**Admisibles** (nunca sobreestiman el costo real):
- **hMAX**: Admisible ✓
- **lmcut**: Admisible ✓ (la más informada admisible)

**NO Admisibles** (pueden sobreestimar):
- **hADD**: NO admisible ✗ (suma valores, puede sobreestimar)
- **hFF**: NO admisible ✗ (basada en plan relajado, puede sobreestimar)
- **Landmark**: NO admisible ✗ (aproximación, puede sobreestimar)
- **hSA**: NO admisible ✗

### ¿Por qué A* necesita heurísticas admisibles?
A* solo garantiza optimalidad si h(n) ≤ h*(n) para todo n, donde h*(n) es el costo real óptimo al objetivo.

### Comandos:
```bash
# BFS (siempre óptimo)
pyperplan -s bfs domain.pddl problem.pddl

# IDS (siempre óptimo)
pyperplan -s ids domain.pddl problem.pddl

# A* con heurísticas admisibles
pyperplan -s astar -H hmax domain.pddl problem.pddl
pyperplan -s astar -H lmcut domain.pddl problem.pddl
```

### Tabla esperada:

| Algoritmo | Heurística | Tiempo (s) | Acciones | Nodos expandidos |
|-----------|------------|------------|----------|------------------|
| BFS       | -          | ...        | ...      | ...              |
| IDS       | -          | ...        | ...      | ...              |
| A*        | hMAX       | ...        | ...      | ...              |
| A*        | lmcut      | ...        | ...      | ...              |

### Discusión esperada:
- **lmcut** debería ser más rápido que hMAX (más informado)
- **lmcut** debería expandir menos nodos que hMAX
- **A*** debería ser más rápido que BFS e IDS en problemas grandes
- Todos deberían encontrar planes con el mismo número de acciones (óptimo)

---

## Automatización con Scripts

Ver `run_experiments.sh` para automatizar las pruebas.
