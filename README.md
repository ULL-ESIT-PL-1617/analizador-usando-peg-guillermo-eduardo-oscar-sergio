# analizador-usando-peg-guillermo-eduardo-oscar-sergio

### Descripción

Diseñe un lenguaje de programación sencillo. Escriba un analizador sintáctico que genere un árbol de análisis abstracto para dicho lenguaje.

---

### Requisitos

1. Escriba un PEG para dicho lenguaje.
2. Deberá devolver el árbol de análisis sintáctico.
3. El lenguaje debe tener:
    * Declaraciones
    * Sentencias IF
    * Condiciones
    * Asignaciones
    * Alguna forma de bucle
    * Funciones y llamadas a funciones
4. Escriba pruebas para el código desarrollado.

---

### Gramática del lenguaje

1. statements ---> (statement ";")+
2. statement ---> "if" condition "{" statements "}" |  "while" "(" condition ")" "{" statements "}" | "print" expression | assign
3. condition ---> expression COMPARISON expression
4. assign ---> ID "=" assign | expression | function
5. function ---> "function" "(" ")" "{" statements "}"
6. expression ---> term (ADDOP term)*
7. term ---> factor (MULOP factor)*
8. factor ---> "(" expression ")" | NUM | ID

---

### Miembros del grupo

* Óscar Darias Plasencia, [alu0100892833](https://alu0100892833.github.io)
* Guillermo Esquivel González,
* Eduardo de la Paz González,
* Sergio García de la Iglesia,  
