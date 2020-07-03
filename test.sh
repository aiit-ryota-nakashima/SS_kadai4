#!/bin/bash

tmp=/tmp/$$

# テストパターン
# テスト1(引数が1)
echo "Please input 2 arguments. argsLength=1" > $tmp-args1

ERROR_EXIT () {
  echo "$1" >&2
  rm -f $tmp-*
  exit 1
}

# テスト開始
./greatest_common_divisor.sh 8177 > $tmp-ans && ERROR_EXIT "error in test1-1"
diff $tmp-ans $tmp-args1 || ERROR_EXIT "error in test1-2"
