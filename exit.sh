#!/bin/sh
#exit.sh
#tests exit and commands with exit

#make all

(
wait 1
echo "ls -a ; exit; echo hello"

) | ./rshell.out#!/bin/sh
#exit.sh
#tests exit and commands with exit

#make all

(
wait 1
echo "ls -a ; exit; echo hello"

) | ./rshell.out
