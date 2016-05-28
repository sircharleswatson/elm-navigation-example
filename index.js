// Require index.html so it gets copied to dist
require('./index.html');

var Elm = require('./src/Main.elm');
var app = Elm.Main.fullscreen();
