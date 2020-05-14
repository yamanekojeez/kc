#! /bin/bash
# 環境設定シェル
if [[ -z $1 ]]; then
	echo "オプションを指定してください!"
else
	echo "オプションは$1です" 
fi

# 環境変数初期化
PATH=$(echo $PATH | sed -e 's;:\?/usr/local/bin;;' -e 's;/usr/local/bin:\?;;')
PATH="$(echo $PATH | sed -r -e 's;:{2,};:;g' -e 's;^:|:$;;g')"

case "$1" in
	[pP] )
	sleep 1; export PATH=/usr/local/bin:$PATH
	echo "環境を設定しました" ;;
	[kK] )
	sleep 1; echo "環境を設定しませんでした" ;;
	[nN] )
	sleep 1; echo "取り消しました" ;;
	* )
	sleep 1; echo "終了します" ;;
esac
