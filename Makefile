# for All Source
getop : getopt.c
	# -Wall:警告は全て表示 -Os:サイズ最適化 -s:strip
	gcc -Wall -Os -s -o getop getopt.c

