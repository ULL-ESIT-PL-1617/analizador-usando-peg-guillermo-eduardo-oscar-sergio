{
  var util = require('util');
  var symbolTable = {
    PI: Math.PI
  };
}

start =
    (statement SEMICOLON)+

statement =
    IF condition LEFTKEY start RIGHTKEY
    / WHILE LEFTPAR condition RIGHTPAR LEFTKEY start RIGHTKEY
    / PRINT expression
    / assignment

condition =
    expression COMPARISON expression

assignment =
    ID ASSIGN assignment
    / expression
    / function

function =
    FUNCTION LEFTPAR RIGHTPAR LEFTKEY start RIGHTKEY

expression =
    term (ADDOP term)*

term =
    factor (MULOP factor)*

factor =
    NUMBER
    / ID
    / LEFTPAR expression RIGHTPAR


_ = $[ \t\n\r]*

ADDOP = PLUS / MINUS
MULOP = MULT / DIV
PLUS = _"+"_
MINUS = _"-"_
MULT = _"*"_
DIV = _"/"_

COMPARISON = EQUALS / BIGGEREQUAL / SMALLEREQUAL / BIGGER / SMALLER
EQUALS = _"=="_
BIGGEREQUAL = _">="_
SMALLEREQUAL = _"<="_
SMALLER = _"<"_
BIGGER = _">"_

LEFTPAR = _"("_
RIGHTPAR = _")"_
LEFTKEY = _"{"_
RIGHTKEY = _"}"_

NUMBER = _ digits:$[0-9]+ _ { return parseInt(digits, 10); }
ID = _ id:$([a-z_]i$([a-z0-9_]i*)) _ { return id; }

ASSIGN = _'='_
COMMA = _','_
SEMICOLON = _";"_

IF = _"if"_
WHILE = _"while"_
PRINT = _"print"_
FUNCTION = _"function"_
