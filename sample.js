#!/usr/bin/env node
/* Node.jsのサンプル */
console.log('何か入力してください!(改行のみは終了)');

/* 入力待ち状態にする*/
process.stdin.resume();
process.stdin.setEncoding('utf8');

/* 入力終了処理 */
process.stdin.on('', function(){
	console.log('入力終了');
});

/* 入力された1行を読み込んだ時のイベント処理 */
process.stdin.on('data', function(inputData){
	/* 末尾の改行除去 */
	let input = inputData.slice(0, -1);
		if (input == ''){
			console.log('終了!');
			process.exit(0);
		} else {
			console.log('入力文字: ' + input);
			console.log('終了!');
			process.exit(0);
		}
});

/* Ctrl+Cが入力された場合のイベント処理 */
process.on('SIGINT', function(){
	/* プロセス終了 */
	console.log('終了!');
	process.exit(0);
});
