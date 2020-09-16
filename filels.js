#!/bin/env node
/* ディレクトリ内容の表示 */
var fs = require('fs');
 
fs.readdir('.', function(err, files) {
	files.forEach(function(f) {
		console.log(f);
	});
});
