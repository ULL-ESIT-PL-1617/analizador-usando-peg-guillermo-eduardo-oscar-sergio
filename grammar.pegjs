{
  var util = require('util');
  var symbolTable = {
    PI: Math.PI
  };
}

start =
    s:(statement SEMICOLON)+ {
      let array = [];
      var arrayLength = s.length;
      for (var i = 0; i < arrayLength; i++) {
          array.push(s[i][0]);
      }
      return array;
    }

statement =
    IF LEFTPAR cond:condition RIGHTPAR LEFTKEY sent:start RIGHTKEY {
      return {
         kind: "IF",
         condition: cond,
         sentence: sent
      };
    }
    / WHILE LEFTPAR cond:condition RIGHTPAR LEFTKEY sent:start RIGHTKEY {
      return {
         kind: "WHILE",
         condition: cond,
         sentence: sent
      };
    }
    / PRINT exp:expression {
      return exp;
    }
    / assig:assignment {
      return assig;
    }

condition =
    rr:expression c:COMPARISON ll:expression {
        return {
            kind: "CONDITION",
            right: rr,
            comp: c[1],
            left: ll
        };
    }

assignment =
    fun:function { return fun; }
    / idd:ID ASSIGN assi:assignment {
        symbolTable[idd] = assi;
        return {
            kind: "ASSIGN",
            id: idd,
            assignment: assi
        };
    }
    / exp:expression { return exp; }

function =
    FUNCTION LEFTPAR RIGHTPAR LEFTKEY sent:start RIGHTKEY{
      return {
         kind: "FUNCTION",
         sentence: sent
      };
    }


expression =
    ter:term vec:(ADDOP term)* {
      if (vec.length == 0) {
         return ter;
      } else {
         let array = [];
         vec.forEach(function(iter) {
            array.push({ kind:iter[0][1], left: ter, right: iter[1] });
         });
         return array;
      }
    }

term =
    fact:factor vec:(MULOP factor)* {
      if (vec.length == 0) {
         return fact;
      } else {
         let array = [];
         vec.forEach(function(iter) {
            array.push({ kind:iter[0][1], left: fact, right: iter[1] });
         });
         return array;
      }
    }

factor =
    num:NUMBER { return num; }
    / id:ID {
        let value = symbolTable[id];
        return value;
    }
    / LEFTPAR exp:expression RIGHTPAR { return exp; }


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
