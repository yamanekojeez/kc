#! /bin/bash
# メモリ解放シェル
echo "メモリ解放開始!"
echo "-------------------------------"
echo "解放前のメモリ状況"
sleep 1;free
echo ""

# ページキャッシュとdentry解放
echo "-------------------------------"
echo "sync;sudo echo 3 > /proc/sys/vm/drop_caches"
# sudoでシェルに渡すとroot権限で内部のコマンドが実行される
sleep 1;sudo sh -c "sync;echo 3 > /proc/sys/vm/drop_caches"
echo ""

echo "-------------------------------"
echo "解放後のメモリ状況"
sleep 1;free
