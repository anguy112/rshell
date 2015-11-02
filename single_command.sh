#!/bin/sh
#single_command.sh
#tests single commands


#make all

(
wait 1
echo "ls -a"

wait 1
echo "ls -al"

wait 1
echo "echo hello"

wait 1
echo "mkdir test"

wait 1
echo "ls"

wait 1
echo "rmdir test"

wait 1
echo "ls"

wait 1
echo "exit"
) | ./rshell.out



