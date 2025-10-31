#!/usr/bin/env bash
echo "20文字以内のアルファベットを2回入力して下さい"
read -r a || { echo "入力が足りません!" >&2; exit 1; }
read -r b || { echo "入力が足りません!" >&2; exit 1; }

# CR削除
a=${a//$'\r'/}
b=${b//$'\r'/}

# 長さチェック
if (( ${#a} < 1 || ${#a} > 20 || ${#b} < 1 || ${#b} > 20 )); then
  echo "エラー: 文字列長は1〜20までです!" >&2
  exit 1
fi

# 英字のみチェック（大文字小文字許可）
if [[ ! $a =~ ^[A-Za-z]+$ || ! $b =~ ^[A-Za-z]+$ ]]; then
  echo "エラー: 文字列はアルファベットのみです!" >&2
  exit 1
fi

printf '%s;%s\n' "$a" "$b"
