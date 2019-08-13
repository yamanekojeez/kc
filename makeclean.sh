#!/bin/bash
# ディレクトリを再帰的にmake clean
if [ -z $1 ]; then
	set "/"
fi

for i in $(find ${1} -name 'Makefile')
do
	dir=$(dirname $i)
	echo $dir
	(cd $dir && make clean | make distclean)
	echo ""
done
