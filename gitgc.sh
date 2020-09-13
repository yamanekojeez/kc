tのクリーン

echo ".gitオブジェクトのクリーン"
echo "-----------------------------------------"

if [ -z $1 ]; then 
    echo "対象のgitディレクトリは/root/bin/wwwです"
    gitdir=$HOME/environment/bin
    cd ${gitdir}
else
    echo "対象のgitディレクトリは$1です"
    gitdir=$HOME/bin/$1
    cd ${gitdir}
    if [ $? -ne 0 ]; then
        echo "終了します"
        exit 1
    fi
fi

echo "クリーン前のサイズ"
du -sh ${gitdir}

echo "-----------------------------------------"
echo "git reflog expire --expire=now --all"
sleep 1 && git reflog expire --expire=now --all
if [ $? -eq 0 ]; then
    echo "OK!"
fi

echo "-----------------------------------------"
echo "git repack -ad"
sleep 1 && git repack -ad
if [ $? -eq 0 ]; then
    echo "OK!"
fi

echo "-----------------------------------------"
echo "git prune"
sleep 1 && git prune
if [ $? -eq 0 ]; then
    echo "OK!"
fi

echo "-----------------------------------------"
echo "git gc"
sleep 1 && git gc
if [ $? -eq 0 ]; then
    echo "OK!"
fi

echo "-----------------------------------------"
echo "クリーン後のサイズ"
du -sh ${gitdir}
exit 0
