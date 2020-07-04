#!/bin/bash

tmp=/tmp/$$

# テストパターン
# テスト1(引数が1)
echo "Please input 2 arguments. argsLength=1" > $tmp-1args
# テスト2(引数が3)
echo "Please input 2 arguments. argsLength=1" > $tmp-3args
# テスト3(第一引数が文字)
echo "Please input numeric arguments arg1=xxx, arg2=3315" > $tmp-non_numeric1
# テスト4(第二引数が文字)

# 例外発生時の共通処理
ERROR_EXIT () {
  echo "$1" >&2
  rm -f $tmp-*
  exit 1
}

# テスト開始
# テスト1
./greatest_common_divisor.sh 8177 > $tmp-ans1 && ERROR_EXIT "error in test1-1"
diff $tmp-ans1 $tmp-1args || ERROR_EXIT "error in test1-2"
# テスト2
./greatest_common_divisor.sh 8177 3315 1245 > $tmp-ans2 && ERROR_EXIT "error in test2-1"
diff $tmp-ans2 $tmp-3args || ERROR_EXIT "error in test2-2"
