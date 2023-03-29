#!/bin/bash
if [[ $1 == "" ]] 
then
    echo "Provide an input name as argument"
fi

filepath="$PWD/$1"
lex -o $filepath.yy.c $filepath.l  &&\
bison -d $filepath.y &&\
gcc -o $filepath.out $filepath.tab.c $filepath.yy.c -lfl &&\
$filepath.out