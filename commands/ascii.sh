#!/bin/bash

#start-readme
: '

# Description

Very helpfull when you need to write some character like \|{}[]<> and you dont remember hexa value

# Usage

jarvis ascii

then press: ctrl + shift + u and the code
'
#end-readme

echo "   2 3 4 5 6 7"
echo "--------------"

for r in 0 1 2 3 4 5 6 7 8 9 A B C D E F
do
  for c in 2 3 4 5 6 7
  do
     value=$(printf "\x$c$r")
     if [[ $c == *"2"* ]]; then
       printf "$r: \x$c$r "
     else
       printf "\x$c$r "
     fi
  done

  echo ""
done
