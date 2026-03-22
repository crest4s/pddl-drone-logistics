# Solución Completa – Parte 2.1: Transportadores

## Dominio

El dominio `drone-domain` de la Parte 2.1 extiende el de la Parte 1 eliminando los brazos e introduciendo transportadores.

### Tipos

```pddl
(:types location drone box person content transporter num - object)
```

### Predicados clave

```pddl
(free-drone ?d - drone)
(holding ?d - drone ?b - box)
(at-transporter ?t - transporter ?l - location)
(in-transporter ?b - box ?t - transporter)
(siguiente ?n1 ?n2 - num)
(transporter-count ?t - transporter ?n - num)
```

### Flujo de trabajo típico

1. `pick-up drone1 box1 depot` — el dron recoge una caja del depósito.
2. `load-onto-transporter drone1 box1 t1 depot n0 n1` — carga la caja en el transportador.
3. Repetir para más cajas (hasta n4).
4. `move-transporter drone1 depot loc1 t1` — vuela con el transportador.
5. `unload-from-transporter drone1 box1 t1 loc1 n0 n1` — saca la caja del transportador.
6. `deliver drone1 person1 box1 loc1 food` — entrega la caja.

### Ventaja del transportador

Al no usar ranuras (slot1, slot2, ...), el planificador no genera estados redundantes por distintas asignaciones de cajas a posiciones. Solo importa cuántas cajas hay, no cuáles están en qué posición.

## Generador

El generador inicializa para cada transportador:
- `(transporter-count t1 n0)` — transportador vacío al inicio.
- `(siguiente n0 n1)` ... `(siguiente n3 n4)` — cadena de sucesor.
- `(at-transporter t1 depot)` — transportador en el depósito.

## Comparativa con Parte 1

Ver `COMPARATIVA_DOMINIOS.md` para la tabla comparativa de tiempos y planes.
