# ANALIZADOR LEXICO GRUPO 12 -FIIS

## Descripción

- El  programa  deberá  solo  utilizar  instrucciones  de  ANSI  C,  independientemente  de  la distribución de C que se emplee para su elaboración.

- Las clases de los componentes léxicosvalidos para el analizador léxico son:

  - Clase Descripcióno
  - 0     constantes enteras (incluyendo octales y hexadecimales).
  - 1     identificadores (según lenguaje C).
  - 2     operadores aritméticos (+,-,%,/).
  - 3     operadores de asignación (según lenguaje C).
  - El número de las clases es inamovible.

- El   analizador   léxico   tendrá   como   entrada   un   archivo   con   las   palabras   que   deberá reconocer. Éste fungirá como programa fuente.
- Como delimitador de un componente léxico será uno varios espacios, tabuladores o saltos de línea, así como el inicio de otro componente léxico.

|Entrada | Reconocimiento |
|--------|----------------|
|suma *=resul| suma -> identificador, *= ->op asignación , resul->identificador|
|int x1%x2 |int->identificador , x1->identificador , %->op aritmético , x2 ->identificador|

- Cuando  detecte  un  error  léxico,  deberá  seguir  el  reconocimiento  a  partir  del  siguiente símbolo valido.

|Entrada | Reconocimiento |
|--------|----------------|
|amigo@yahoo.com| amigo->identificador, @->error ,yahoo->identificador, . -> error , com->identificador|

- Los token’s contendrán 2 campos.
  - Campo1: la clase (entero de un byte).
  - Campo2: el valor (de acuerdo a las sig. Tablas)

| Op Asignación | |
|----------|------|
|Operador  | Valor|
|=  | 0
|+= | 1
|-= | 2
|*= | 3
|/= | 4
|%= | 5
|l= | 6
|&= | 7
|>>=| 8
|<<=| 9
|^= | 10

|Op Aritméticos | |
|---------------|-|
|Operador |  Valor|
|+ | 0
|- | 1
|% | 2
|/ | 3

El valor para el token de  cada identificador es  la posición dentro de  la tabla de  símbolos y de las constantes enteras su valor numérico en base 10.

- Como  resultado,  el  analizador  léxico  deberá  mostrar  el  contenido  tanto  de  la  tabla  de  símbolos como de los tokens.

- Los  errores  que  vaya  encontrando  el  analizador  léxico,  los  podrá  ir  mostrando  en  pantalla  o escribirlos en un archivo.

El programa deberá estar documentado.
