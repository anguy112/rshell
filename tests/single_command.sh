#!/bin/sh
#single_command.sh
#tests single commands


#make all

(
echo "ls -a"

echo "ls -al"

echo "echo hello"

echo "mkdir test"

echo "ls "

echo "rmdir test ;"

echo "ls;"

echo "exit"
) | ../bin/rshell


