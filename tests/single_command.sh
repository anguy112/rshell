#!/bin/sh
#single_command.sh
#tests single commands


#make all

(
echo "ls -a"

echo "ls -a;"

echo "ls -a ;"

echo "ls -al"

echo "echo hello"

echo "echo hello world"

echo "mkdir test"

echo "ls"

echo "rmdir test ;"

echo "ls;"

echo "ls -P"  #bad command

echo "rmdir"  #bad command

echo "pwb"  #bad command

echo "pwd"

echo "exit"

) | ../bin/rshell

