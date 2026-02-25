# Práctica 1 - Parte 1: Planificación Automática con PDDL
## Sistema de Logística de Emergencias con Drones

---

## 📁 Archivos Generados

### Ejercicio 1.1: Dominio y Problemas PDDL

- **`domain.pddl`**: Dominio completo en STRIPS + :typing
  - 5 tipos: location, drone, box, person, content
  - 8 predicados
  - 5 acciones: pick-up-left, pick-up-right, drop-off-left, drop-off-right, fly

- **`problem1.pddl`**: Problema simple (1 persona, 1 caja)
- **`problem2.pddl`**: Problema complejo (2 personas, 3 cajas)

### Ejercicio 1.2: Generador de Problemas

- **`generate-problem.py`**: Script Python completo para generar problemas
  - Parámetros: -d (drones), -r (carriers), -l (localizaciones), -p (personas), -c (cajas), -g (metas)
  - Los problemas generados se guardan en: `generated/problem/`
  - Los planes de pyperplan (.soln) se guardan en: `generated/soln/`
  - Los planes de planutils (.plan) se guardan en: `generated/plan/`

### Ejercicio 1.3: Análisis y Experimentación

- **`GUIA_EJERCICIO_1.3.md`**: Guía completa para realizar experimentos
- **`run_experiments.sh`**: Script automatizado para ejecutar todos los experimentos
- **`EXPLICACION_MODELADO.md`**: Documentación detallada de decisiones de diseño

---

## 🚀 Inicio Rápido

### 1. Verificar archivos PDDL

```bash
# Ver estructura del dominio
cat domain.pddl

# Ver problema de ejemplo
cat problem1.pddl
```

### 2. Generar problemas con Python

```bash
# Problema pequeño: 3 localizaciones, 3 personas, 3 cajas, 3 metas
python3 generate-problem.py -d 1 -r 0 -l 3 -p 3 -c 3 -g 3

# Problema mediano
python3 generate-problem.py -d 1 -r 0 -l 5 -p 5 -c 5 -g 5

# Problema grande
python3 generate-problem.py -d 1 -r 0 -l 10 -p 10 -c 10 -g 10
```

El script genera un archivo `.pddl` en `generated/problem/` con el nombre del problema.

### 3. Instalar Planificadores

#### Pyperplan (Python)

```bash
# Opción 1: pip
pip install pyperplan

# Opción 2: desde código fuente
git clone https://github.com/aibasel/pyperplan.git
cd pyperplan
python setup.py install
```

#### FF (Fast-Forward)

```bash
# Descargar desde https://fai.cs.uni-saarland.de/hoffmann/ff.html
wget http://fai.cs.uni-saarland.de/hoffmann/ff/FF-v2.3.tgz
tar -xzf FF-v2.3.tgz
cd FF-v2.3
make

# Mover binario a carpeta del proyecto
cp ff /home/adrianmoralesrodriguez/LabsPDDL/planificacion-automatica-lab/
```

### 4. Probar con Planificadores

```bash
# Pyperplan con GBFS + hFF (rápido)
pyperplan -s gbfs -H hff domain.pddl generated/problem/drone_problem_d1_r0_l3_p3_c3_g3_ct2.pddl

# Pyperplan con A* + hMAX (óptimo)
pyperplan -s astar -H hmax domain.pddl generated/problem/drone_problem_d1_r0_l3_p3_c3_g3_ct2.pddl

# FF (si está instalado)
./ff -o domain.pddl -f generated/problem/drone_problem_d1_r0_l3_p3_c3_g3_ct2.pddl
```

**Nota**: Los planes generados por pyperplan (archivos `.soln`) se guardan automáticamente en `generated/soln/`

---

## 📊 Ejercicio 1.2: Generación de Problemas

### Generar serie de problemas crecientes

```bash
for size in 3 5 7 10 15 20; do
    python3 generate-problem.py -d 1 -r 0 -l $size -p $size -c $size -g $size
done
```

### Probar con FF hasta encontrar límite de 60 segundos

```bash
# Script manual
for size in 3 5 7 10 15 20 25 30; do
    problem="generated/problem/drone_problem_d1_r0_l${size}_p${size}_c${size}_g${size}_ct2.pddl"
    echo "Probando tamaño $size..."
    timeout 60 ./ff -o domain.pddl -f $problem
done
```

### Generar gráfica tiempo vs tamaño

Usar los datos de tiempo para crear gráfica con Python/Excel/Gnuplot.

---

## 🔬 Ejercicio 1.3: Análisis de Rendimiento

### Ejercicio 1.3.1: Comparativa Algoritmos Básicos

```bash
# Generar problema de prueba
python3 generate-problem.py -d 1 -r 0 -l 5 -p 5 -c 5 -g 5
problem="generated/problem/drone_problem_d1_r0_l5_p5_c5_g5_ct2.pddl"

# BFS (búsqueda no informada, óptima)
pyperplan -s bfs domain.pddl $problem

# IDS (búsqueda no informada, óptima)
pyperplan -s ids domain.pddl $problem

# A* con hMAX (búsqueda informada, óptima)
pyperplan -s astar -H hmax domain.pddl $problem

# GBFS con hMAX (búsqueda informada, no óptima pero rápida)
pyperplan -s gbfs -H hmax domain.pddl $problem
```

**Métricas a registrar:**
- Tamaño del problema (l, p, c, g)
- Tiempo de ejecución (segundos)
- Longitud del plan (número de acciones)
- Nodos expandidos
- ¿Es óptimo?

### Ejercicio 1.3.2: Heurísticas Satisficing

```bash
# Encontrar problema máximo que GBFS resuelve en 60s
# Asumiendo que es tamaño 10:
python3 generate-problem.py -d 1 -r 0 -l 10 -p 10 -c 10 -g 10
problem="generated/problem/drone_problem_d1_r0_l10_p10_c10_g10_ct2.pddl"

# Probar GBFS con todas las heurísticas
pyperplan -s gbfs -H hmax domain.pddl $problem
pyperplan -s gbfs -H hadd domain.pddl $problem
pyperplan -s gbfs -H hff domain.pddl $problem
pyperplan -s gbfs -H landmark domain.pddl $problem

# Probar EHC con todas las heurísticas
pyperplan -s ehc -H hmax domain.pddl $problem
pyperplan -s ehc -H hadd domain.pddl $problem
pyperplan -s ehc -H hff domain.pddl $problem
pyperplan -s ehc -H landmark domain.pddl $problem
```

**Diferencias GBFS vs EHC:**
- **GBFS**: Best-first search, explora más ampliamente
- **EHC**: Hill climbing con backtracking BFS, más rápido pero puede fallar
- **FF usa**: Primero EHC+hFF, si falla cambia a GBFS+hFF

### Ejercicio 1.3.3: Heurísticas Admisibles (Óptimas)

```bash
# Encontrar problema máximo que A* resuelve en 60s
# Asumiendo que es tamaño 7:
python3 generate-problem.py -d 1 -r 0 -l 7 -p 7 -c 7 -g 7
problem="generated/problem/drone_problem_d1_r0_l7_p7_c7_g7_ct2.pddl"

# Algoritmos que garantizan optimalidad
pyperplan -s bfs domain.pddl $problem            # Sin heurística
pyperplan -s ids domain.pddl $problem            # Sin heurística
pyperplan -s astar -H hmax domain.pddl $problem  # hMAX es admisible
pyperplan -s astar -H lmcut domain.pddl $problem # lmcut es admisible
```

**Heurísticas admisibles en pyperplan:**
- ✅ **hMAX**: Admisible
- ✅ **lmcut**: Admisible (la más informada)
- ❌ **hADD**: NO admisible
- ❌ **hFF**: NO admisible
- ❌ **landmark**: NO admisible
- ❌ **hSA**: NO admisible

### Script Automatizado

```bash
# Ejecutar todos los experimentos automáticamente
./run_experiments.sh

# Ver resultados
ls results/
cat results/gbfs_hff.txt
```

---

## 📝 Puntos Clave del Modelado

### 1. Brazos del Dron (Sin Precondiciones Negativas)

**Desafío**: Modelar límite de 2 cajas sin usar `(not ...)` en precondiciones.

**Solución**: Predicados positivos para cada brazo:
- `(empty-left ?d)` y `(empty-right ?d)`
- `(holding-left ?d ?b)` y `(holding-right ?d ?b)`
- Acciones separadas: `pick-up-left` y `pick-up-right`

**Garantía**: Solo puede coger si brazo está vacío → máximo 2 cajas.

### 2. Contenido Genérico de Cajas

**Desafío**: Extensible sin modificar el dominio.

**Solución**: Predicado `(box-content ?b - box ?c - content)`
- En dominio: genérico, funciona con cualquier contenido
- En problema: especificar `food`, `medicine`, `water`, etc.

### 3. Compatibilidad STRIPS

✅ Solo tipos y predicados booleanos
✅ Precondiciones solo positivas
✅ Sin efectos condicionales
✅ Sin funciones numéricas
✅ Extension :typing permitida

---

## 🎯 Para el Reporte

### Explicar en la Memoria:

1. **Ejercicio 1.1**:
   - Cómo modelaste los brazos del dron
   - Por qué no usas precondiciones negativas
   - Cómo garantizas el límite de 2 cajas
   - Modelado genérico del contenido

2. **Ejercicio 1.2**:
   - Tamaño máximo resuelto por FF en 60s
   - Gráfica tiempo vs tamaño
   - Análisis de escalabilidad

3. **Ejercicio 1.3.1**:
   - Tabla comparativa BFS, IDS, A*, GBFS
   - Análisis de optimalidad
   - Justificación de resultados

4. **Ejercicio 1.3.2**:
   - Tabla GBFS vs EHC con todas las heurísticas
   - Explicación diferencia GBFS/EHC
   - Cómo lo usa FF

5. **Ejercicio 1.3.3**:
   - Tabla algoritmos óptimos
   - Cuáles heurísticas son admisibles y por qué
   - Mejor combinación algoritmo+heurística

---

## 📚 Referencias

- **PDDL**: https://planning.wiki/
- **Pyperplan**: https://github.com/aibasel/pyperplan
- **FF Planner**: https://fai.cs.uni-saarland.de/hoffmann/ff.html
- **Curso TDDD48**: https://www.ida.liu.se/~TDDD48/

---

## ✅ Checklist de Entrega

- [ ] `domain.pddl` funcional
- [ ] `problem1.pddl` y `problem2.pddl` correctos
- [ ] `generate-problem.py` completo
- [ ] Experimentos Ejercicio 1.2 realizados
- [ ] Experimentos Ejercicio 1.3.1, 1.3.2, 1.3.3 realizados
- [ ] Tablas con resultados generadas
- [ ] Gráficas generadas
- [ ] Memoria PDF con explicaciones y análisis

---

## 🆘 Troubleshooting

### Error: "Parsing error"
- Verifica espacios: `?d - drone` no `?d-drone`
- Elimina comentarios del PDDL
- Verifica paréntesis balanceados

### Error: "Unsatisfiable goal"
- Verifica que hay suficientes cajas con el contenido necesario
- Verifica que las personas están en localizaciones válidas

### Planificador muy lento
- Reduce el tamaño del problema
- Usa GBFS + hFF en lugar de BFS
- Usa EHC si el problema tiene buena heurística

---

## 👤 Autor

Adrián Morales Rodríguez
Práctica 1 - Planificación Automática
Curso 2025-26
