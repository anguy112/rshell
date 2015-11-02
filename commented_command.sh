#!/bin/sh
#commented_command.sh
#tests commands with comments

#make all

(
wait 1
echo "ls #-a ;"

wait 1
echo "ls -l#a ;"

wait 1
echo "ls ; #echo hello || mkdir test || echo world;"

wait 1
echo "exit"

) | ./rshell.out

