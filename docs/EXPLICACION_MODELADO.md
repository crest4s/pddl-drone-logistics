# Documentación del Modelado PDDL - Ejercicio 1.1

## Decisiones de Diseño y Justificación

### 1. Modelado de los Brazos del Dron (Aspecto Crítico)

#### Problema a resolver:
- El dron debe poder llevar **máximo 2 cajas** simultáneamente
- Debe hacerse en **STRIPS puro** (sin fluents numéricos)
- **NO se permiten precondiciones negativas**

#### Solución adoptada: Dos brazos independientes

He modelado los brazos del dron usando **4 predicados distintos**:

```pddl
(empty-left ?d - drone)
(empty-right ?d - drone)
(holding-left ?d - drone ?b - box)
(holding-right ?d - drone ?b - box)
```

#### ¿Cómo funciona?

1. **Estado inicial**: Ambos brazos vacíos
   ```pddl
   (empty-left drone1)
   (empty-right drone1)
   ```

2. **Cuando recoge una caja** (brazo izquierdo):
   ```pddl
   (:action pick-up-left
       :precondition (and
           (at-drone ?d ?l)
           (at-box ?b ?l)
           (empty-left ?d)  ; El brazo DEBE estar vacío
       )
       :effect (and
           (holding-left ?d ?b)
           (not (empty-left ?d))  ; Ya NO está vacío
           (not (at-box ?b ?l))
       )
   )
   ```

3. **Límite de 2 cajas garantizado**:
   - Solo puede hacer `pick-up-left` si `(empty-left ?d)` es verdadero
   - Solo puede hacer `pick-up-right` si `(empty-right ?d)` es verdadero
   - Una vez que ambos brazos tienen cajas, **ninguna precondición de pick-up se satisface**
   - Por lo tanto, es **imposible** coger una tercera caja

#### ¿Por qué NO usamos precondiciones negativas?

**Forma INCORRECTA** (usaría precondiciones negativas):
```pddl
(:action pick-up
    :precondition (and
        (at-drone ?d ?l)
        (at-box ?b ?l)
        (not (holding-left ?d ?other))  ; ❌ Precondición negativa
        (not (holding-right ?d ?other)) ; ❌ Precondición negativa
    )
    ...
)
```

**Forma CORRECTA** (la que usamos):
```pddl
(:action pick-up-left
    :precondition (and
        (at-drone ?d ?l)
        (at-box ?b ?l)
        (empty-left ?d)  ; ✓ Precondición POSITIVA
    )
    ...
)
```

#### Ventajas de esta aproximación:

1. ✅ **Sin precondiciones negativas**: Usamos `(empty-left ?d)` en lugar de `(not (holding-left ?d ?b))`
2. ✅ **STRIPS puro**: Solo predicados booleanos, sin funciones numéricas
3. ✅ **Correctitud**: Imposible violar el límite de 2 cajas
4. ✅ **Eficiencia**: El planificador no necesita razonar sobre negaciones
5. ✅ **Extensible**: Fácil añadir más brazos si fuera necesario

---

### 2. Modelado Genérico del Contenido de las Cajas

#### Problema:
El enunciado especifica que **NO debemos usar predicados específicos** como:
```pddl
(caja-comida ?c)      ; ❌ INCORRECTO
(caja-medicina ?c)    ; ❌ INCORRECTO
```

Porque si añadimos nuevos tipos de contenido (agua, mantas, etc.), **habría que modificar el dominio**.

#### Solución: Relación genérica box-content

```pddl
(:types
    box
    content  ; Tipo genérico para cualquier contenido
)

(:predicates
    (box-content ?b - box ?c - content)  ; Relaciona caja con contenido
    (has-content ?p - person ?c - content)  ; Persona tiene contenido
)
```

#### ¿Cómo funciona?

1. **En el dominio** (NO se modifica para nuevos contenidos):
   ```pddl
   (:action drop-off-left
       :parameters (?d - drone ?b - box ?p - person ?l - location ?c - content)
       :precondition (and
           (at-drone ?d ?l)
           (at-person ?p ?l)
           (holding-left ?d ?b)
           (box-content ?b ?c)  ; La caja TIENE ese contenido
       )
       :effect (and
           (has-content ?p ?c)  ; La persona RECIBE ese contenido
           (empty-left ?d)
           (not (holding-left ?d ?b))
       )
   )
   ```

2. **En el problema** (se especifican los contenidos):
   ```pddl
   (:objects
       food medicine water blankets - content  ; Añadimos los que queramos
       ...
   )
   
   (:init
       (box-content crate1 food)
       (box-content crate2 medicine)
       (box-content crate3 water)      ; Nuevo tipo sin cambiar dominio
       (box-content crate4 blankets)   ; Otro nuevo tipo
   )
   ```

3. **Meta genérica**:
   ```pddl
   (:goal (and
       (has-content person1 food)      ; Persona necesita comida
       (has-content person1 medicine)  ; Y medicina
       (has-content person2 water)     ; Otra persona necesita agua
   ))
   ```

#### Ventajas:

1. ✅ **Extensible**: Nuevos contenidos solo en el problema, no en el dominio
2. ✅ **Flexible**: Una persona puede necesitar múltiples contenidos
3. ✅ **Correcto**: La persona recibe el contenido que necesita, no una caja específica
4. ✅ **Realista**: A la persona le importa QUÉ recibe, no QUÉ caja es

---

### 3. Estructura de Acciones STRIPS

#### Acciones implementadas:

1. **pick-up-left / pick-up-right**: Coger caja con brazo específico
2. **drop-off-left / drop-off-right**: Entregar caja a persona
3. **fly**: Moverse entre localizaciones

#### Nota sobre drop-off:

La acción `drop-off` **entrega la caja a una persona específica**, no solo la deja en el suelo:

```pddl
(:action drop-off-left
    :parameters (?d - drone ?b - box ?p - person ?l - location ?c - content)
    :precondition (and
        (at-drone ?d ?l)
        (at-person ?p ?l)       ; La persona DEBE estar ahí
        (holding-left ?d ?b)
        (box-content ?b ?c)
    )
    :effect (and
        (has-content ?p ?c)     ; La persona RECIBE el contenido
        (empty-left ?d)
        (not (holding-left ?d ?b))
        ; La caja desaparece (fue entregada)
    )
)
```

Esto es importante porque:
- ✅ La meta es que personas **tengan** contenidos, no que haya cajas en localizaciones
- ✅ Simplifica el modelo (no necesitamos trackear cajas después de entregarlas)
- ✅ Evita ambigüedades (¿quién tiene la caja si hay 2 personas en la misma localización?)

---

### 4. Verificación de Compatibilidad STRIPS

#### Checklist de requisitos STRIPS:

- ✅ **Solo tipos básicos**: location, drone, box, person, content
- ✅ **Solo predicados booleanos**: Nada de funciones numéricas
- ✅ **Precondiciones positivas**: No usamos `(not ...)` en precondiciones
- ✅ **Efectos atómicos**: Add y delete simples
- ✅ **Sin efectos condicionales**: No usamos `(when ...)` en efectos
- ✅ **Sin cuantificadores**: No usamos `(forall ...)` o `(exists ...)`
- ✅ **Extension :typing**: Sí, está explícitamente permitida

#### Lo que NO usamos (por restricciones STRIPS):

```pddl
; ❌ Precondiciones negativas
(:action example
    :precondition (not (blocked ?l))  ; NO PERMITIDO
)

; ❌ Efectos condicionales
(:action example
    :effect (when (condition) (effect))  ; NO PERMITIDO
)

; ❌ Metas negativas
(:goal (and
    (delivered ?c)
    (not (broken ?c))  ; NO PERMITIDO en meta
))

; ❌ Funciones numéricas
(define (domain ...)
    (:functions (fuel ?d - drone))  ; NO PERMITIDO
)
```

---

### 5. Problemas de Ejemplo

#### Problem1.pddl (Simple):
- 1 dron, 1 caja, 1 persona, 2 localizaciones
- Plan óptimo: 4 acciones
  1. pick-up-left crate1
  2. fly depot → loc1
  3. drop-off-left crate1 person1
  4. fly loc1 → depot

#### Problem2.pddl (Complejo):
- 1 dron, 3 cajas, 2 personas, 3 localizaciones
- Persona1 necesita: food y medicine
- Persona2 necesita: food
- Plan óptimo: ~12 acciones (requiere múltiples viajes)

---

## Resumen de Decisiones Clave

| Aspecto | Decisión | Razón |
|---------|----------|-------|
| Brazos del dron | 2 acciones pick-up (left/right) | Evitar precondiciones negativas |
| Contenido de cajas | Predicado box-content genérico | Extensibilidad sin modificar dominio |
| Entrega de cajas | drop-off entrega a persona específica | Claridad y corrección del modelo |
| Nivel PDDL | STRIPS + :typing | Compatibilidad con todos los planificadores |
| Negaciones | Solo en efectos, NO en precondiciones/metas | Requisito STRIPS estricto |

---

## Validación

Para validar que el dominio es correcto:

```bash
# Probar con VAL (validador)
validate domain.pddl problem1.pddl plan1.txt

# Probar con distintos planificadores
pyperplan domain.pddl problem1.pddl
ff -o domain.pddl -f problem1.pddl
```

Si todos los planificadores aceptan el dominio y encuentran planes, ¡el modelado es correcto! ✅
