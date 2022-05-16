#!/usr/bin/env bash

cat <<label
This is an AWK based calculator

label

read -p "Enter a: " a
read -p "Enter b: " b

read -p "Select an action:
a) or A) addition
s) or S) subtraction
m) or M) multiplication
d) or D) division

" action

<< comment
case $action in
[aA])
  echo "You choice is addition"
  echo "$a $b" | awk '{ a=$1; b=$2; print "a+b="a+b }'
  ;;
[sS])
  echo "$a $b" | awk '{ a=$1; b=$2; print "a-b="a-b }'
  ;;
[mM])
  echo "$a $b" | awk '{ a=$1; b=$2; print "a*b="a*b }'
  ;;
[dD])
  if [[ $b -eq 0 ]]
  then
    echo "Division by zero is not allowed"
    exit 1
  fi
  echo "$a $b" | awk 'a=$1; b=$2; { a=$1; b=$2; print "a/b="a/b }'
  ;;
*)
  echo "You selected a wrong operation"
  exit 1
esac
comment

case $action in
[aA])
  echo "You choice is addition"
  awk -v a=$a -v b=$b 'BEGIN { print "a+b="a+b }'
  ;;
[sS])
  awk -v a=$a -v b=$b 'BEGIN { print "a-b="a-b }'
  ;;
[mM])
  awk -v a=$a -v b=$b 'BEGIN { print "a*b="a*b }'
  ;;
[dD])
  if [[ $b -eq 0 ]]
  then
    echo "Division by zero is not allowed"
    exit 1
  fi
  awk -v a=$a -v b=$b 'BEGIN { print "a/b="a/b }'
  ;;
*)
  echo "You selected a wrong operation"
  exit 1
esac