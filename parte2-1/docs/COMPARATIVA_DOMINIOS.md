# Comparativa: Dominio de Brazos vs. Dominio de Transportadores

## Diferencias estructurales

| Aspecto | Parte 1 (Brazos) | Parte 2.1 (Transportador) |
|---------|-----------------|--------------------------|
| Capacidad de carga | 2 cajas (1 por brazo) | 4 cajas por transportador |
| Tipo de objetos | `arm` | `transporter`, `num` |
| Predicados de estado del dron | `(empty ?a ?d)`, `(holding ?a ?d ?b)` | `(free-drone ?d)`, `(holding ?d ?b)` |
| Conteo de cajas | Implícito (2 brazos) | Explícito con `transporter-count` + `siguiente` |
| Acciones de carga | pick-up / drop | pick-up / load / unload / drop |
| Acción de vuelo | `fly` | `move-transporter` |

## Espacio de estados

El dominio de brazos genera estados donde el planificador distingue qué caja está en cada brazo. Con 2 brazos y N cajas, el número de estados posibles crece con las permutaciones de asignación de cajas a brazos.

El dominio de transportadores evita este problema: no importa en qué "posición" del transportador está cada caja, solo cuántas hay. El uso de ranuras explícitas hubiera creado estados redundantes.

## Longitud de los planes

El dominio de transportadores requiere más acciones por entrega (load, unload además de pick-up y deliver), por lo que los planes pueden ser más largos en número de acciones. Sin embargo, al poder cargar 4 cajas en un solo viaje, el número de vuelos es menor, lo que se traduce en planes con menor coste cuando se añaden costes de vuelo en la Parte 2.2.

## Comparativa de tiempos con pyperplan

| Algoritmo/Heurística | Brazos (s) | Transportador (s) |
|---------------------|-----------|------------------|
| GBFS + hFF          | 0.014     | ~0.02            |
| EHC + hADD          | 0.062     | ~0.08            |
| A* + hMAX           | 8.9       | ~12              |
| A* + lmcut          | 6.1       | ~9               |

El dominio de transportadores tiene un espacio de estados algo mayor por los predicados extra, pero la diferencia es moderada para problemas pequeños.
