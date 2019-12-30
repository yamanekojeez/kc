#!/usr/bin/env node
/* 引数を受け取る */
if(process.argv.length < 3) {
	console.log('引数を入力して下さい!');
	console.log('aaもしくはbb');
	process.exit(0);
}

for(let i = 0;i < process.argv.length;i++){
	console.log("argv[" + i + "] = " + process.argv[i]);
}

switch(process.argv[2]){
	case 'aa':
		console.log('成功');
		break;
	case 'bb':
		console.log('大成功');
		break;
}
