#!/bin/bash

# ファイルの改行コードチェック
if [ $# != 1 ]; then
    echo "ERROR 引数に誤りがあります、処理を中断します"
    echo "Usage：crlfcheck.sh [ チェック対象のディレクトリ名 ]"
    exit
fi

SHNM=$(basename $0)

rm -f /dev/shm/${SHNM}.log > /dev/null 2>&1
rm -f /dev/shm/${SHNM}_real.log > /dev/null 2>&1

touch /dev/shm/${SHNM}.log > /dev/null 2>&1
touch /dev/shm/${SHNM}_real.log > /dev/null 2>&1

echo "START $(date)"

for file in $(\find $1 -type f); do
    file ${file} >> /dev/shm/${SHNM}_real.log 2>&1
    CRLFCOUNT=`file ${file} | grep -c "CRLF"`

    if [ ${CRLFCOUNT} -eq "0" ];then
        echo "LF,${file}" >> /dev/shm/${SHNM}.log 2>&1
    else
        echo "CRLF,${file}" >> /dev/shm/${SHNM}.log 2>&1
    fi
done

echo "結果：CRLFのファイルは$(cat /dev/shm/${SHNM}.log | grep -c "CRLF")件でした"
echo "END $(date)"
