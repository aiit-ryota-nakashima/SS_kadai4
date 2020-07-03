#!/bin/bash                                                                                                                                                                                          

# 引数の長さチェック
if [ $# -ne 2 ]; then
  echo "Invalid number of arguments. argsLength=$#"
  exit 1
fi 

# 引数チェック
expr $1 + 1 >/dev/null 2>&1
ret1=$?
expr $2 + 1 >/dev/null 2>&1
ret2=$?
if [ $ret1 -ge 2 ] || [ $ret2 -ge 2 ]; then
  echo "A non-numeric value is specified in the argument. arg1=$1, arg2=$2"
  exit 1
  fi

# a>bの条件になるように引数を調整する。
if [ $1 -lt $2 ]; then
  set $2 $1
fi
echo "target: $1, $2"
 
# ユークリッドの互除法で最大公約数を算出
while [ 0 -lt $1 ]
do
  t=`expr $2 % $1`
  set $t $1
done
echo "result: $2"
