#!/bin/bash

tmp=/tmp/$$

# テストパターン
# テスト1(引数が1)
echo "Please input 2 arguments. argsLength=1" > $tmp-1args
# テスト2(引数が3)
echo "Please input 2 arguments. argsLength=3" > $tmp-3args
# テスト3(第一引数が文字)
echo "Please input natural number arguments. arg1=xxx, arg2=3315" > $tmp-non_numeric1
# テスト4(第二引数が文字)
echo "Please input natural number arguments. arg1=8177, arg2=xxx" > $tmp-non_numeric2
# テスト5(両引数が文字)
echo "Please input natural number arguments. arg1=xxx, arg2=xxx" > $tmp-non_numeric3
# テスト6(第一引数が小数)
echo "Please input natural number arguments. arg1=1.5, arg2=3315" > $tmp-decimal1
# テスト7(第二引数が小数)
echo "Please input natural number arguments. arg1=8817, arg2=1.5" > $tmp-decimal2
# テスト8(両引数が小数)
echo "Please input natural number arguments. arg1=1.5, arg2=1.5" > $tmp-decimal3
# テスト9(第一引数が0)
echo "Please input natural number arguments. arg1=0, arg2=3315" > $tmp-zero1
# テスト10(第二引数が0)
echo "Please input natural number arguments. arg1=8817, arg2=0" > $tmp-zero2
# テスト11(両引数が0)
echo "Please input natural number arguments. arg1=0, arg2=0" > $tmp-zero3

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
# テスト3
./greatest_common_divisor.sh xxx 3315 > $tmp-ans3 && ERROR_EXIT "error in test3-1"
diff $tmp-ans3 $tmp-non_numeric1 || ERROR_EXIT "error in test3-2"
# テスト4
./greatest_common_divisor.sh 8177 xxx > $tmp-ans4 && ERROR_EXIT "error in test4-1"
diff $tmp-ans4 $tmp-non_numeric2 || ERROR_EXIT "error in test4-2"
# テスト5
./greatest_common_divisor.sh xxx xxx > $tmp-ans5 && ERROR_EXIT "error in test5-1"
diff $tmp-ans5 $tmp-non_numeric3 || ERROR_EXIT "error in test5-2"
# テスト6
./greatest_common_divisor.sh 1.5 3315 > $tmp-ans6 && ERROR_EXIT "error in test6-1"
diff $tmp-ans6 $tmp-decimal1 || ERROR_EXIT "error in test6-2"
# テスト7
./greatest_common_divisor.sh 8817 1.5 > $tmp-ans7 && ERROR_EXIT "error in test7-1"
diff $tmp-ans7 $tmp-decimal2 || ERROR_EXIT "error in test7-2"
# テスト8
./greatest_common_divisor.sh 1.5 1.5 > $tmp-ans8 && ERROR_EXIT "error in test8-1"
diff $tmp-ans8 $tmp-decimal3 || ERROR_EXIT "error in test8-2"
# テスト9
./greatest_common_divisor.sh 0 3315 > $tmp-ans9 && ERROR_EXIT "error in test9-1"
diff $tmp-ans9 $tmp-zero1 || ERROR_EXIT "error in test9-2"
# テスト10
./greatest_common_divisor.sh 8817 0 > $tmp-ans10 && ERROR_EXIT "error in test10-1"
diff $tmp-ans10 $tmp-zero2 || ERROR_EXIT "error in test10-2"
# テスト11
./greatest_common_divisor.sh 0 0 > $tmp-ans11 && ERROR_EXIT "error in test11-1"
diff $tmp-ans11 $tmp-zero3 || ERROR_EXIT "error in test11-2"
