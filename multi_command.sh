#!/bin/sh
#multi_command.sh
#tests commands with ;, &&, or ||

#make all

(
wait 1
echo "ls ; mkdir test ; ls ; rmdir test ; ls ;"

wait 1
echo "ls -a; echo hello ; ls && mkdir test2 ; ls -a ;"
    
wait 1
echo "ls -a; echo hello ; bad cmd && mkdir test2 ; ls -a ;"

wait 1
echo "ls -a; echo hello ; bad cmd || mkdir test2 ; ls -a ;"

wait 1
echo "ls ; echo hello && mkdir test || echo world ; "

wait 1
echo "ls ; echo hello && mkdir test && echo world ; "

wait 1
echo "ls ; echo hello || mkdir test || echo world;"

wait 1
echo "exit"
) | ./rshell.out


