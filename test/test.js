var chai = require('chai');
var PEG = require('../grammar.js');

var expect = chai.expect;

function removeSpaces(str){
  return str.replace(/\s/g,'');;
}

describe("Asignaciones", function() {
  it("a = 4 + 5;", function() {

    var tree = `[
      {
        "kind": \"ASSIGN\",
        "id": \"a\",
        "assignment": [
          {
            "kind": \"+\",
            "left": 4,
            "right": 5
          }
        ]
      }
    ]`;  // Falta poner aqui lo que devuelve el árbol exactamente con la prueba


    var tree2 = removeSpaces(tree);
    var resul = removeSpaces(JSON.stringify(PEG.parse('a = 4 + 5;'), null, 2));

    expect(resul).to.equal(tree2);
  });

  it("r = 16; t = r / 4;", function() {

    var tree = `[
      {
        "kind": "ASSIGN",
        "id": "r",
        "assignment": 16
      },

      {
        "kind": "ASSIGN",
        "id": "t",
        "assignment": [
          {
            "kind": "/",
            "left": 16,
            "right": 4
          }
        ]
      }
    ]`;  // Falta poner aqui lo que devuelve el árbol exactamente con la prueba

    var resul = removeSpaces(JSON.stringify(PEG.parse('r = 16; t = r / 4;'), null, 2));
    var tree2 = removeSpaces(tree);

    expect(resul).to.equal(tree2);
  });
});

describe("Funciones", function(){
  it("funcion = function(){ r = 4; };", function() {
    var tree = `[
      {
        "kind": "ASSIGN",
        "id": "funcion",
        "assignment":
          {
            "kind": "FUNCTION",
            "sentence": [
              {
                "kind": "ASSIGN",
                "id": "r",
                "assignment": 4
              }
            ]
          }
        }
      ]`;  // Falta poner aqui lo que devuelve el árbol exactamente con la prueba

    var resul = removeSpaces(JSON.stringify(PEG.parse('funcion = function(){ r = 4; };'), null, 2));
    var tree2 = removeSpaces(tree);

    expect(resul).to.equal(tree2);
  });
});

describe("Condicionales", function() {
  it("a = 4; if (a == 4)  { a = a + 7; };", function(){
    var tree = `[
      {
        "kind": "ASSIGN",
        "id": "a",
        "assignment": 4
      },

      {
        "kind": "IF",
        "condition":
          {
            "kind": "CONDITION",
            "right": 4,
            "comp": "==",
            "left": 4
          },

          "sentence": [
            {
              "kind": "ASSIGN",
              "id": "a",
              "assignment": [
                {
                  "kind": "+",
                  "left": 4,
                  "right": 7
                }
              ]
            }
          ]
        }
      ]`;  // Falta poner aqui lo que devuelve el árbol exactamente con la prueba

    var resul = removeSpaces(JSON.stringify(PEG.parse('a = 4; if (a == 4)  { a = a + 7; };'), null, 2));
    var tree2 = removeSpaces(tree);

    expect(resul).to.equal(tree2);
  });
});

describe("While", function() {
  it("i = 1; while(i < 3){ i = i + 1; };", function(){
    var tree = `[
      {
        "kind": "ASSIGN",
        "id": "i",
        "assignment": 1
      },

      {
        "kind": "WHILE",
        "condition":
        {
          "kind": "CONDITION",
          "right": 1,
          "comp": "<",
          "left": 3
        },

        "sentence": [
          {
            "kind": "ASSIGN",
            "id": "i",
            "assignment": [
              {
                "kind": "+",
                "left": 1,
                "right": 1
              }
            ]
          }
        ]
      }
    ]`;  // Falta poner aqui lo que devuelve el árbol exactamente con la prueba

    var resul = removeSpaces(JSON.stringify(PEG.parse('i = 1; while(i < 3){ i = i + 1; };'), null, 2));
    var tree2 = removeSpaces(tree);


    expect(resul).to.equal(tree2);
  });
});
