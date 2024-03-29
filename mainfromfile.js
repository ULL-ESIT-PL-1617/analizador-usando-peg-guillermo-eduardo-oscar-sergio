#!/usr/local/bin/node 
var util = require('util');
var fs = require('fs');
var PEG = require("./grammar.js");
var fileName = process.argv[2] || 'input';
fs.readFile(fileName, 'utf8', function (err,input) {
    if (err) {
        return console.log(err);
    }
    console.log(`Processing <\n${input}\n>`);
    var r = PEG.parse(input);
    console.log(util.inspect(r, {depth: null}));
});
