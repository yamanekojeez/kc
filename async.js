#!/bin/env node
/* 非同期処理 */
var async = require('async');

async.series([
	function(callback) {
		callback(null, '一番目');
	},
	function(callback) {
		callback(null, '2番目');
	},
	function(callback) {
		callback(null, '3番目');
	}
], function (err, result) {
  console.log(result);
});

async.parallel([
	function(callback) {
		setTimeout(function() {
			callback(null, '3秒後の文字列');
		}, 2000);
	},
	function(callback) {
		setTimeout(function() {
			callback(null, '1秒後の文字列');
		}, 1000);
	}
],function(err, results) {
  console.log(results);
});
