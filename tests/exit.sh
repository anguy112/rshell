#!/bin/sh
#exit.sh
#tests exit and commands with exit

#make all

(
echo "ls ; echo hello; exit; echo world"

) | ../bin/rshell


(
echo "ls; exit; echo world"

) | ../bin/rshell


(
echo "ls && exit;"

) | ../bin/rshell


(
echo "LS || exit;"

) | ../bin/rshell


(
echo "ls"
echo "echo hello"
echo "exit;"


) | ../bin/rshell

