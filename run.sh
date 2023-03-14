#!/bin/bash
if [[ $1 == "" ]]
 then
 echo "Provide an input name as argument"
else
lex $1.l
bison -d $1.y
gcc $1.tab.c lex.yy.c -lfl
./a.out
fi