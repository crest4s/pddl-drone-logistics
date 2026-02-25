# Información Teórica: Algoritmos y Heurísticas de Planificación

## Algoritmos de Búsqueda

### 1. BFS (Breadth-First Search)
**Tipo**: Búsqueda no informada
**Características**:
- Explora nivel por nivel en el grafo de estados
- **Completo**: Siempre encuentra solución si existe
- **Óptimo**: Encuentra el plan con menor número de acciones
- **Complejidad espacial**: O(b^d) - puede consumir mucha memoria
- **Complejidad temporal**: O(b^d)
- **Uso**: Problemas pequeños donde garantizamos optimalidad

### 2. IDS (Iterative Deepening Search)
**Tipo**: Búsqueda no informada
**Características**:
- DFS con límite de profundidad incremental
- **Completo**: Sí
- **Óptimo**: Sí (igual que BFS)
- **Complejidad espacial**: O(bd) - mucho mejor que BFS
- **Complejidad temporal**: O(b^d)
- **Ventaja**: Optimalidad de BFS con memoria de DFS
- **Uso**: Cuando BFS consume demasiada memoria

### 3. A* (A-star)
**Tipo**: Búsqueda informada
**Características**:
- Usa función f(n) = g(n) + h(n)
  - g(n): costo desde inicio hasta n
  - h(n): estimación heurística de n al objetivo
- **Completo**: Sí
- **Óptimo**: Sí, SI la heurística es admisible
- **Admisible**: h(n) ≤ h*(n) (nunca sobreestima)
- **Eficiencia**: Mejor que BFS si h es informativa
- **Uso**: Cuando necesitamos solución óptima y tenemos buena heurística

### 4. GBFS (Greedy Best-First Search)
**Tipo**: Búsqueda informada
**Características**:
- Usa solo h(n), ignora g(n)
- Expande siempre el nodo con mejor heurística
- **Completo**: No (puede quedar en bucles)
- **Óptimo**: No
- **Ventaja**: Muy rápido si la heurística guía bien
- **Problema**: Puede quedar atrapado en mínimos locales
- **Uso**: Planificación satisficing (queremos solución rápida, no óptima)

### 5. EHC (Enforced Hill Climbing)
**Tipo**: Búsqueda informada con hill climbing
**Características**:
- Hill climbing: solo avanza si h mejora
- Si se atasca: hace BFS limitada hasta encontrar mejora
- **Completo**: No garantizado
- **Óptimo**: No
- **Ventaja**: Extremadamente rápido cuando funciona
- **Problema**: Puede fallar en mínimos locales difíciles
- **Uso**: Primera estrategia en FF; si falla, cambiar a GBFS

### 6. Weighted A* (WA*)
**Tipo**: Búsqueda informada
**Características**:
- f(n) = g(n) + w·h(n), donde w > 1
- Pone más peso en la heurística → más greedy
- **Completo**: Sí
- **Óptimo**: No (pero bounded: solución ≤ w × óptima)
- **Ventaja**: Más rápido que A*, solución "casi óptima"
- **Uso**: Compromiso velocidad-calidad

---

## Heurísticas de Planificación

### Conceptos Clave

**Admisible**: h(n) ≤ h*(n) - nunca sobreestima el costo real
- ✅ Necesaria para optimalidad con A*

**Consistente**: h(n) ≤ c(n,a,n') + h(n') - propiedad más fuerte
- ✅ Si es consistente, es admisible

**Informativa**: Cuanto mayor h(n), más informativa (menos nodos expande A*)

---

### hMAX - Maximum Cost Heuristic

**Definición**: 
- Problema relajado: ignorar delete effects de acciones
- hMAX(s) = máximo costo para alcanzar cualquier objetivo individual

**Cálculo**:
- Resuelve cada sub-objetivo independientemente
- Toma el máximo de todos

**Propiedades**:
- ✅ **Admisible**: Siempre
- ✅ **Consistente**: Sí
- ⚠️ **Informativa**: Poco informada (pesimista)

**Ejemplo**:
```
Estado: (on A table), (on B table)
Meta: (on A B), (on B C)
hMAX = max(costo_lograr(on A B), costo_lograr(on B C))
```

**Ventajas**: Rápida de calcular, admisible
**Desventajas**: Muy conservadora, expande muchos nodos

---

### hADD - Additive Cost Heuristic

**Definición**:
- Suma individual de costos para cada sub-objetivo
- hADD(s) = Σ costo(sub-objetivo_i)

**Propiedades**:
- ❌ **NO Admisible**: Puede sobreestimar (double counting)
- ✅ **Informativa**: Más que hMAX
- ⚠️ **Uso**: Solo para planificadores satisficing

**Ejemplo**:
```
Estado: (on A table), (on B table)
Meta: (on A B), (on B C)
hADD = costo(on A B) + costo(on B C)
      ↑ Puede contar acciones comunes dos veces
```

**Ventajas**: Más informada que hMAX → menos nodos
**Desventajas**: No admisible → no óptima

---

### hFF - Fast-Forward Heuristic

**Definición**:
1. Relajar problema (ignorar delete effects)
2. Encontrar plan relajado con búsqueda greedy
3. h(s) = longitud del plan relajado

**Propiedades**:
- ❌ **NO Admisible**: Plan relajado puede ser más corto que el real
- ✅ **Muy Informativa**: Contexto de acciones
- ⚠️ **Uso**: Heurística de referencia para satisficing

**Algoritmo FF completo**:
1. Intenta EHC + hFF (rápido)
2. Si falla, usa GBFS + hFF (robusto)

**Ventajas**: 
- Extremadamente efectiva en práctica
- Ganadora de muchas competiciones IPC
**Desventajas**: 
- No admisible
- Computacionalmente más cara que hMAX/hADD

---

### Landmark Heuristic

**Definición**:
- **Landmark**: Hecho que debe ser verdadero en algún punto de cualquier plan
- h(s) = número de landmarks no alcanzados desde s

**Ejemplo**:
```
Inicio: (at robot A)
Meta: (at robot D)
Landmarks obligatorios:
- Debe pasar por B (único camino)
- Debe abrir puerta-B
h = landmarks no logrados
```

**Propiedades**:
- ❌ **NO Admisible**: Puede sobreestimar
- ✅ **Informativa**: Captura dependencias obligatorias
- ⚠️ **Costo computacional**: Alto (extracción de landmarks)

**Variantes**:
- **lmcut**: Versión admisible (corte de landmarks)
- **Landmark counting**: Simple conteo (no admisible)

---

### lmcut - Landmark-Cut Heuristic

**Definición**:
- Identifica "cortes" obligatorios en el grafo de dependencias
- Cada corte es un conjunto de acciones que debe ejecutarse
- h(s) = suma de costos de cortes disjuntos

**Propiedades**:
- ✅ **Admisible**: Garantizado
- ✅ **Muy Informativa**: La heurística admisible más informada en muchos dominios
- ⚠️ **Costo computacional**: Mucho más cara que hMAX

**Uso**:
- **Mejor opción para planificación óptima** cuando A*+hMAX es muy lento
- Expande muchos menos nodos que hMAX
- Trade-off: más tiempo por nodo, pero menos nodos totales

---

### hSA - Set-Additive Heuristic

**Definición**:
- Particiona objetivos en subconjuntos disjuntos
- Suma costos de cada subconjunto

**Propiedades**:
- ❌ **NO Admisible** (en general)
- ✅ **Más informada que hADD**
- ⚠️ **Uso**: Investigación, menos común

---

## Tabla Comparativa Heurísticas

| Heurística | Admisible | Informativa | Costo Cálculo | Uso Principal |
|-----------|-----------|-------------|---------------|---------------|
| **hMAX**  | ✅ Sí     | ⭐ Baja     | 💚 Rápido     | A* óptimo básico |
| **hADD**  | ❌ No     | ⭐⭐ Media  | 💚 Rápido     | GBFS/EHC satisficing |
| **hFF**   | ❌ No     | ⭐⭐⭐ Alta | 💛 Media      | **GBFS/EHC preferido** |
| **Landmark** | ❌ No  | ⭐⭐⭐ Alta | 🧡 Costoso    | GBFS avanzado |
| **lmcut** | ✅ Sí     | ⭐⭐⭐⭐ Muy Alta | ❤️ Muy costoso | **A* óptimo avanzado** |
| **hSA**   | ❌ No     | ⭐⭐⭐ Alta | 💛 Media      | Investigación |

---

## Decisión de Algoritmo según Necesidad

### ¿Necesitas solución ÓPTIMA?

**Sí → Algoritmos óptimos**:
1. **Problema pequeño** (< 1000 estados):
   - BFS o IDS
   
2. **Problema mediano**:
   - A* + hMAX (primera prueba)
   - A* + lmcut (si hMAX muy lento)

3. **Problema grande**:
   - A* + lmcut
   - Si muy lento, considera reducir problema o aceptar no-óptimo

### ¿Quieres solución RÁPIDA? (satisficing)

**Sí → Algoritmos satisficing**:
1. **Primera opción**: 
   - EHC + hFF (estrategia de FF)
   - Si falla, GBFS + hFF

2. **Alternativas**:
   - GBFS + hADD
   - GBFS + Landmark

3. **Si heurísticas costosas**:
   - GBFS + hMAX (menos informado pero más rápido)

---

## Para el Reporte: Respuestas Teóricas

### ¿Qué heurísticas son admisibles?

**Admisibles (para A* óptimo)**:
- ✅ hMAX
- ✅ lmcut

**NO admisibles**:
- ❌ hADD (suma → double counting)
- ❌ hFF (plan relajado puede ser más corto)
- ❌ Landmark (conteo puede sobreestimar)

### ¿Diferencia entre GBFS y EHC?

**GBFS**:
- **Estrategia**: Best-first, explora ampliamente
- **Comportamiento**: Siempre avanza al mejor nodo disponible
- **Ventajas**: Más robusto, más probabilidad de éxito
- **Desventajas**: Más lento, más memoria

**EHC**:
- **Estrategia**: Hill climbing con enforce
- **Comportamiento**: Solo avanza si h mejora; si se atasca, hace BFS limitada
- **Ventajas**: Muy rápido cuando funciona
- **Desventajas**: Puede fallar completamente

### ¿Cómo los usa FF?

FF usa estrategia híbrida:
1. **Fase 1**: EHC + hFF
   - Si encuentra solución: ✅ Termina (muy rápido)
   - Si se atasca: ⬇️ Pasa a fase 2

2. **Fase 2**: GBFS + hFF
   - Más robusto, encuentra solución aunque sea más largo

**Resultado**: Combina velocidad de EHC con robustez de GBFS

---

## Justificación de Resultados Esperados

### En tu dominio (logística de emergencias):

**Por qué hFF debería ser mejor que hADD/hMAX**:
- Muchas acciones secuenciales (pick → fly → drop)
- hFF captura bien estas secuencias
- hADD y hMAX las tratan independientemente

**Por qué lmcut > hMAX** (óptimos):
- lmcut detecta que "para entregar caja a loc1, DEBES volar a loc1"
- hMAX solo ve costo de cada objetivo independiente
- lmcut → menos nodos expandidos → más rápido (si amortiza costo cálculo)

**Por qué BFS/IDS serán muy lentos**:
- Exploración ciega en espacio grande
- Muchas acciones irrelevantes (volar a lugares sin personas)

**Por qué EHC puede ser el más rápido** (si funciona):
- Heurística guía directamente a objetivos
- Pocas backtrackings en problemas simples
- Pero puede fallar en problemas más complejos

---

## Referencias Bibliográficas

- **FF Planner**: Hoffmann, J., & Nebel, B. (2001). "The FF Planning System"
- **hMAX/hADD**: Bonet, B., & Geffner, H. (2001). "Planning as Heuristic Search"
- **lmcut**: Helmert, M., & Domshlak, C. (2009). "Landmarks, Critical Paths and Abstractions"
- **Pyperplan**: https://github.com/aibasel/pyperplan

---

Usa esta información para explicar y justificar tus resultados experimentales en la memoria. 🎓
