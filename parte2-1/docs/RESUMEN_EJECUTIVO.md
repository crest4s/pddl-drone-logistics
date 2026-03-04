# 📋 RESUMEN EJECUTIVO - Práctica 1 Parte 1

## ✅ Archivos Entregables Generados

### 🎯 Ejercicio 1.1: Dominio y Problemas PDDL

| Archivo | Descripción | Estado |
|---------|-------------|--------|
| `domain.pddl` | Dominio completo STRIPS + :typing | ✅ Completo |
| `problem1.pddl` | Problema simple: 1 persona, 1 caja | ✅ Completo |
| `problem2.pddl` | Problema complejo: 2 personas, 3 cajas | ✅ Completo |

**Características del dominio**:
- ✅ STRIPS puro (sin precondiciones negativas)
- ✅ Extension :typing activada
- ✅ 5 tipos: location, drone, box, person, content
- ✅ 8 predicados
- ✅ 5 acciones: pick-up-left, pick-up-right, drop-off-left, drop-off-right, fly
- ✅ Modelado de 2 brazos sin precondiciones negativas
- ✅ Contenido genérico extensible

---

### 🐍 Ejercicio 1.2: Generador Python

| Archivo | Descripción | Estado |
|---------|-------------|--------|
| `generate-problem.py` | Generador completo de problemas PDDL | ✅ Completo |

**Uso**:
```bash
python3 generate-problem.py -d 1 -r 0 -l 5 -p 5 -c 5 -g 5
```

**Parámetros**:
- `-d`: Número de drones
- `-r`: Número de carriers (para futuras partes)
- `-l`: Número de localizaciones (sin contar depot)
- `-p`: Número de personas
- `-c`: Número de cajas
- `-g`: Número de metas (goals)

**Características**:
- ✅ Genera estado inicial válido
- ✅ Distribuye personas entre localizaciones
- ✅ Asigna contenidos a cajas aleatoriamente
- ✅ Genera metas aleatorias pero satisfacibles
- ✅ Compatible con domain.pddl

---

### 🔬 Ejercicio 1.3: Análisis y Experimentación

| Archivo | Descripción | Estado |
|---------|-------------|--------|
| `GUIA_EJERCICIO_1.3.md` | Guía completa para realizar experimentos | ✅ Completo |
| `run_experiments.sh` | Script automatizado de experimentos | ✅ Completo |
| `HEURISTICAS_TEORIA.md` | Información teórica de heurísticas | ✅ Completo |

**Contenido de la guía**:
- ✅ Comandos para cada ejercicio (1.3.1, 1.3.2, 1.3.3)
- ✅ Métricas a registrar
- ✅ Tablas esperadas
- ✅ Explicación teórica de algoritmos y heurísticas
- ✅ Diferencias entre GBFS y EHC
- ✅ Heurísticas admisibles identificadas

---

### 📚 Documentación Adicional

| Archivo | Descripción | Estado |
|---------|-------------|--------|
| `README.md` | Guía completa de uso del proyecto | ✅ Completo |
| `EXPLICACION_MODELADO.md` | Justificación de decisiones de diseño | ✅ Completo |
| `install_planners.sh` | Script de instalación de planificadores | ✅ Completo |

---

## 🎓 Puntos Clave para la Memoria

### Ejercicio 1.1: Decisiones de Modelado

#### 1. ¿Cómo modelaste los brazos del dron?

**Respuesta**: 
He usado **4 predicados para modelar 2 brazos independientes**:
- `(empty-left ?d)` y `(empty-right ?d)`: Indican si un brazo está libre
- `(holding-left ?d ?b)` y `(holding-right ?d ?b)`: Indican qué caja sostiene cada brazo

**Acciones**:
- `pick-up-left`: Solo funciona si `(empty-left ?d)` es verdadero
- `pick-up-right`: Solo funciona si `(empty-right ?d)` es verdadero

**Garantía del límite de 2 cajas**:
Una vez que ambos brazos están ocupados, ninguna precondición de `pick-up` se puede satisfacer, por lo que es **imposible** coger una tercera caja.

#### 2. ¿Por qué NO usas precondiciones negativas?

**Alternativa INCORRECTA** (con negación):
```pddl
(:action pick-up
    :precondition (and
        (at-drone ?d ?l)
        (at-box ?b ?l)
        (not (holding ?d ?other))  ; ❌ Precondición negativa
    )
)
```

**Solución CORRECTA** (sin negación):
```pddl
(:action pick-up-left
    :precondition (and
        (at-drone ?d ?l)
        (at-box ?b ?l)
        (empty-left ?d)  ; ✅ Precondición POSITIVA
    )
)
```

**Razón**: 
- STRIPS estricto **no permite** `(not ...)` en precondiciones
- Usamos predicados **positivos complementarios**: `empty-left` en lugar de `not holding-left`
- Esto garantiza **compatibilidad con todos los planificadores**

#### 3. ¿Cómo modelaste el contenido de las cajas?

**Solución**: Predicado genérico `(box-content ?b - box ?c - content)`

**Ventajas**:
1. ✅ **Extensible**: Nuevos tipos de contenido se añaden en el **problema**, no en el dominio
2. ✅ **Genérico**: El dominio funciona con cualquier contenido (food, medicine, water, etc.)
3. ✅ **Realista**: A la persona le importa el **contenido**, no la caja específica

**Ejemplo**:
```pddl
; En el problema (no en el dominio):
(:objects
    food medicine water blankets - content  ; Añadir los que queramos
)

(:init
    (box-content crate1 food)
    (box-content crate2 medicine)
    (box-content crate3 water)  ; Nuevo tipo sin modificar dominio
)
```

---

### Ejercicio 1.2: Rendimiento con FF

**Tarea**: Generar problemas de complejidad creciente y encontrar el límite de 60 segundos con FF.

**Comando de prueba**:
```bash
for size in 3 5 7 10 15 20 25 30; do
    python3 generate-problem.py -d 1 -r 0 -l $size -p $size -c $size -g $size
    timeout 60 ./ff -o domain.pddl -f drone_problem_d1_r0_l${size}_p${size}_c${size}_g${size}_ct2.pddl
done
```

**En la memoria incluir**:
1. Tabla con tamaños probados y tiempos
2. Tamaño máximo resuelto en 60s
3. Gráfica: Eje X = tamaño, Eje Y = tiempo
4. Análisis de escalabilidad

---

### Ejercicio 1.3.1: Comparativa Algoritmos Básicos

**Algoritmos a probar**:
- BFS (óptimo, no informado)
- IDS (óptimo, no informado)
- A* + hMAX (óptimo, informado)
- GBFS + hMAX (satisficing, informado)

**Tabla esperada**:

| Algoritmo | Tamaño | Tiempo (s) | Acciones | Óptimo | Nodos Expandidos |
|-----------|--------|------------|----------|--------|------------------|
| BFS       | ...    | ...        | ...      | ✅     | ...              |
| IDS       | ...    | ...        | ...      | ✅     | ...              |
| A*+hMAX   | ...    | ...        | ...      | ✅     | ...              |
| GBFS+hMAX | ...    | ...        | ...      | ❌     | ...              |

**Análisis esperado**:
- BFS e IDS: Muy lentos, pero óptimos
- A*: Más rápido que BFS/IDS si heurística ayuda
- GBFS: El más rápido, pero no óptimo
- Todos los óptimos encuentran **mismo número de acciones**

---

### Ejercicio 1.3.2: Heurísticas Satisficing

**Heurísticas a probar**: hMAX, hADD, hFF, Landmark
**Algoritmos**: GBFS vs EHC

**Diferencias teóricas**:

| Aspecto | GBFS | EHC |
|---------|------|-----|
| Estrategia | Best-first search | Hill climbing + BFS |
| Velocidad | Moderada | Muy rápido (si funciona) |
| Robustez | Alta | Baja (puede fallar) |
| Memoria | Alta | Baja |

**Planificador FF**:
1. Fase 1: Intenta **EHC + hFF** (rápido)
2. Fase 2: Si falla, usa **GBFS + hFF** (robusto)

**En la memoria**:
- Tabla comparativa de tiempos
- Identificar heurística más rápida
- Explicar cuándo EHC falla y GBFS funciona

---

### Ejercicio 1.3.3: Heurísticas Admisibles

**Pregunta clave**: ¿Cuáles heurísticas en pyperplan son admisibles?

**Respuesta**:
- ✅ **hMAX**: Admisible (nunca sobreestima)
- ✅ **lmcut**: Admisible (la más informada admisible)
- ❌ **hADD**: NO admisible (suma → double counting)
- ❌ **hFF**: NO admisible (plan relajado puede ser más corto)
- ❌ **Landmark**: NO admisible (aproximación)

**Experimentos**:
```bash
pyperplan -s bfs domain.pddl problem.pddl
pyperplan -s ids domain.pddl problem.pddl
pyperplan -s astar -H hmax domain.pddl problem.pddl
pyperplan -s astar -H lmcut domain.pddl problem.pddl
```

**Tabla esperada**:

| Algoritmo | Heurística | Tiempo (s) | Acciones | Nodos |
|-----------|------------|------------|----------|-------|
| BFS       | -          | ...        | X        | ...   |
| IDS       | -          | ...        | X        | ...   |
| A*        | hMAX       | ...        | X        | ...   |
| A*        | lmcut      | ...        | X        | ...   |

**Análisis esperado**:
- Todos encuentran **mismo número de acciones** (óptimo)
- lmcut debería expandir **menos nodos** que hMAX
- lmcut debería ser **más rápido** que hMAX (si amortiza costo de cálculo)
- A* debería ser **mucho más rápido** que BFS/IDS

---

## 🚀 Cómo Ejecutar Todo

### 1. Instalar planificadores
```bash
./install_planners.sh
```

### 2. Probar problemas básicos
```bash
# Problema simple
pyperplan -s gbfs -H hff domain.pddl problem1.pddl

# Problema complejo
pyperplan -s gbfs -H hff domain.pddl problem2.pddl
```

### 3. Generar problemas de prueba
```bash
for size in 3 5 7 10; do
    python3 generate-problem.py -d 1 -r 0 -l $size -p $size -c $size -g $size
done
```

### 4. Ejecutar todos los experimentos
```bash
./run_experiments.sh
```

### 5. Analizar resultados
```bash
ls results/
cat results/*.txt
```

---

## 📊 Estructura para la Memoria PDF

### Sección 1: Ejercicio 1.1

1. **Descripción del dominio**
   - Tipos y predicados
   - Acciones y sus efectos
   
2. **Decisiones de modelado**
   - Brazos del dron (explicar predicados positivos)
   - Contenido genérico de cajas
   - Por qué no hay precondiciones negativas
   
3. **Problemas de ejemplo**
   - problem1.pddl: Descripción y plan esperado
   - problem2.pddl: Descripción y plan esperado

### Sección 2: Ejercicio 1.2

1. **Generador Python**
   - Modificaciones realizadas
   - Cómo distribuye objetos
   
2. **Experimentos con FF**
   - Tabla: tamaño vs tiempo
   - Gráfica de escalabilidad
   - Tamaño máximo resuelto en 60s
   
3. **Análisis**
   - Discusión de resultados
   - Limitaciones del planificador

### Sección 3: Ejercicio 1.3

#### 1.3.1: Comparativa Algoritmos

- Tabla comparativa (BFS, IDS, A*, GBFS)
- Discusión de optimalidad
- Análisis de eficiencia

#### 1.3.2: Heurísticas Satisficing

- Tabla GBFS vs EHC con todas las heurísticas
- Explicación diferencias GBFS/EHC
- Cómo lo usa FF

#### 1.3.3: Heurísticas Admisibles

- Tabla algoritmos óptimos
- Identificación de heurísticas admisibles
- Mejor combinación para optimalidad
- Justificación teórica

---

## ✅ Checklist Final

- [x] domain.pddl creado y validado
- [x] problem1.pddl creado
- [x] problem2.pddl creado
- [x] generate-problem.py completado
- [x] Documentación de modelado (EXPLICACION_MODELADO.md)
- [x] Guía ejercicio 1.3 (GUIA_EJERCICIO_1.3.md)
- [x] Información teórica heurísticas (HEURISTICAS_TEORIA.md)
- [x] Script de experimentos (run_experiments.sh)
- [x] Script de instalación (install_planners.sh)
- [x] README completo

**Pendiente (tú debes hacer)**:
- [ ] Instalar planificadores (pyperplan, FF)
- [ ] Ejecutar experimentos
- [ ] Recopilar datos y crear tablas
- [ ] Generar gráficas
- [ ] Escribir memoria PDF con análisis

---

## 🎯 Próximos Pasos

1. **Instalar planificadores**:
   ```bash
   ./install_planners.sh
   ```

2. **Probar que todo funciona**:
   ```bash
   pyperplan -s gbfs -H hff domain.pddl problem1.pddl
   ```

3. **Ejecutar experimentos**:
   ```bash
   ./run_experiments.sh
   ```

4. **Analizar resultados y escribir memoria**

---

## 📞 Ayuda Rápida

**¿Errores de sintaxis PDDL?**
- Verifica espacios: `?d - drone` no `?d-drone`
- Paréntesis balanceados
- Sin comentarios en archivos PDDL

**¿Pyperplan no funciona?**
```bash
export PATH="$HOME/.local/bin:$PATH"
pip3 install --user pyperplan
```

**¿Plan no óptimo?**
- Usa A* o BFS, no GBFS
- Verifica heurística admisible (hMAX o lmcut)

**¿Muy lento?**
- Reduce tamaño del problema
- Usa GBFS + hFF en lugar de BFS
- Usa EHC + hFF si quieres solución rápida

---

## 🏆 ¡Todo Listo!

Tienes todos los archivos necesarios para completar la Práctica 1 Parte 1. Solo falta:
1. Ejecutar los experimentos
2. Recopilar resultados
3. Escribir la memoria con el análisis

¡Mucho éxito! 🚀
