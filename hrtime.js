#!/bin/env node
/* Node.jsの実行速度測定 */

console.log('測定開始');
var start = new Date();
var hrstart = process.hrtime();
var simulateTime = 0;

console.time('hrtime');
setTimeout(function(argument) {
	var end = new Date() - start,
	hrend = process.hrtime(hrstart);
	console.info('Execution time: %dms', end);
	console.info('Execution time(hr): %ds %dms', hrend[0], hrend[1] / 1000000);
}, 1500, simulateTime);
console.timeEnd('hrtime');
