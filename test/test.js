var chai = require('chai');
var PEG = require('../grammar.js');

var expect = chai.expect;

/* function removeSpaces(str){
  return str.replace(/\s/g,'');;
} */

describe("Asignaciones", function() {
  it("a = 4 + 5;", function() {

    var tree = '';  // Falta poner aqui lo que devuelve el árbol exactamente con la prueba

    var resul = JSON.stringify(PEG.parse('a = 4 + 5;'), null, 2));

    expect(resul).to.equal(tree);
  });

  it("t = r / 4", function() {

    var tree = '';  // Falta poner aqui lo que devuelve el árbol exactamente con la prueba

    var resul = JSON.stringify(PEG.parse('t = r / 4;'), null, 2));

    expect(resul).to.equal(tree);
  });
});

describe("Funciones", function(){
  it("var funcion = function(){ var r = 4 }", function() {
    var tree = '';  // Falta poner aqui lo que devuelve el árbol exactamente con la prueba

    var resul = JSON.stringify(PEG.parse('var funcion = function(){ var r = 4 }'), null, 2));

    expect(resul).to.equal(tree);
  });
});

describe("Condicionales", function() {
  it("if (a = 4) b++;", function(){
    var tree = '';  // Falta poner aqui lo que devuelve el árbol exactamente con la prueba

    var resul = JSON.stringify(PEG.parse('if (a = 4) b++;'), null, 2));

    expect(resul).to.equal(tree);
  });
});

describe("While", function() {
  it("while(i < 3){ i++; }", function(){
    var tree = '';  // Falta poner aqui lo que devuelve el árbol exactamente con la prueba

    var resul = JSON.stringify(PEG.parse('while(i < 3){ i++; }'), null, 2));

    expect(resul).to.equal(tree);
  });
});
