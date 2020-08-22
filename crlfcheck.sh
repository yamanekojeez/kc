#!/bin/bash

if [ $# != 1 ]; then
	echo "ERROR 引数に誤りがあります、処理を中断します"
	echo "Usage：crlfcheck.sh [ チェック対象のディレクトリ名 ]"
	exit
fi

SHNM=$(basename $0)

rm -f ./log/${SHNM}.log > /dev/null 2>&1
rm -f ./log/${SHNM}_real.log > /dev/null 2>&1

mkdir ./log > /dev/null 2>&1

touch ./log/${SHNM}.log > /dev/null 2>&1
touch ./log/${SHNM}_real.log > /dev/null 2>&1

echo "START $(date)"

for file in $(\find $1 -type f); do
	file ${file} >> ./log/${SHNM}_real.log 2>&1
	CRLFCOUNT=`file ${file} | grep -c "CRLF"`

	if [ ${CRLFCOUNT} -eq "0" ];then
		echo "LF,${file}" >> ./log/${SHNM}.log 2>&1
	else
		echo "CRLF,${file}" >> ./log/${SHNM}.log 2>&1
	fi
done

echo "結果：CRLFのファイルは$(cat ./log/${SHNM}.log | grep -c "CRLF")件でした"
echo "END $(date)"
