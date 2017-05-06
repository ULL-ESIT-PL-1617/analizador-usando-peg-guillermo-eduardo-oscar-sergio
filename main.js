var PEG = require("./grammar.js");
var input = process.argv[2] || "a = 4, b = 2*a, c = a+b";
console.log(`Processing <${input}>`);
var r = PEG.parse(input);
console.log(JSON.stringify(r, null, 2));
