#!/bin/sh
#commented_command.sh
#tests commands with comments

#make all

(
echo "ls #-l ;"

echo "ls# -l ;"

echo "ls -l#a ;"

echo "ls ; #echo hello || mkdir test || echo world;"

echo "ls ; # echo hello;"

echo "echo hello # echo wotld"

echo "#"

echo "exit"

) | ../bin/rshell

