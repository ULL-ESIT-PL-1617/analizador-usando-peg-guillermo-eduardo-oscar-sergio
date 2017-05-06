{
  var util = require('util');
  var symbolTable = {
    PI: Math.PI
  };
}

start =
    a:comma {
        return {symbolTable: symbolTable, result:a }
    }

comma
    = left:assign right:(COMMA last:assign)* {
        let val;
        right.forEach((x) => {
            val = x[1];
        });
        return val;
    }

assign
  = id:ID ASSIGN a:additive {
         symbolTable[id] = a;
         return a;
      }
  / additive

additive
  = left:multiplicative rest:(ADDOP multiplicative)* {
       let sum = left;
       rest.forEach( (x) => {
         eval(`sum ${x[0]}= ${x[1]}`);
       });
       return sum;
    }
  / multiplicative

multiplicative
  = left:primary rest:(MULOP primary)* {
      return rest.reduce((prod, [op, num])=>{ return eval(prod+op+num); },left);
    }
  / primary

primary
  = integer
  / id:ID  { return symbolTable[id]; }
  / LEFTPAR assign:assign RIGHTPAR { return assign; }

integer "integer"
  = NUMBER

_ = $[ \t\n\r]*

ADDOP = PLUS / MINUS
MULOP = MULT / DIV
PLUS = _"+"_  { return '+'; }
MINUS = _"-"_ { return '-'; }
MULT = _"*"_  { return '*'; }
DIV = _"/"_   { return '/'; }
LEFTPAR = _"("_
RIGHTPAR = _")"_
NUMBER = _ digits:$[0-9]+ _ { return parseInt(digits, 10); }
ID = _ id:$([a-z_]i$([a-z0-9_]i*)) _ { console.log(id); return id; }
ASSIGN = _ '=' _
COMMA = _ ','_
