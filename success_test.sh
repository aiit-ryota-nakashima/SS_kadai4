#!/bin/bash

tmp=/tmp/$$

# テスト1(第一引数>第二引数)
echo "target: 8177, 3315" > $tmp-success1
echo "result: 221" >> $tmp-success1
# テスト2(第二引数>第一引数)
echo "target: 8177, 3315" > $tmp-success2
echo "result: 221" >> $tmp-success2

# 例外発生時の共通処理
ERROR_EXIT () {
  echo "$1" >&2
  rm -f $tmp-*
  exit 1
}

# テスト開始
# テスト1
./greatest_common_divisor.sh 8177 3315 > $tmp-ans1 || ERROR_EXIT "error in test1-1"
diff $tmp-ans1 $tmp-success1 || ERROR_EXIT "error in test1-2"
# テスト2
./greatest_common_divisor.sh 3315 8177 > $tmp-ans2 || ERROR_EXIT "error in test2-1"
diff $tmp-ans2 $tmp-success2 || ERROR_EXIT "error in test2-2"
