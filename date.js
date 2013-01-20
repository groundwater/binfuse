var util = require('util')

var d = new Date()

console.log( 
  new Date().toISOString()
    .replace(/-/g,'')
    .replace('T','-')
    .replace(':','')
    .substr(2,11)
)