#!/bin/sh
#multi_command.sh
#tests commands with ;, &&, or ||

#make all

(

echo "echo ONE; ls"

echo "echo TWO;ls"

echo "echo THRRE ; ls ; mkdir test1 ; ls ; rmdir test1; ls;"

echo "echo FOUR ;ls -l;ls && mkdir test1;ls;rmdir test1;ls"
    
echo "echo FIVE; ls -l && mkdir test2 || echo PIPE ; ls;"

echo "echo SIX ;ls -l && rmdir test2 && echo AND ;ls;"

echo "echo SEVEN ; ls -l || mkdir test4 || echo PIPE;"

echo "echo EIGHT ;ls -l; LS && echo Bad Command ; ls -a"

echo "echo NINE ; ls -l ||  echo Good Command || ls;"

echo "echo TEN ; ls -l; LS || echo Bad Command  ; ls  ;"

echo "echo hello && test -d ../bin ; ls ;"

echo "echo hello || test -d ../bin ; ls ;"

echo "exit"

) | ../bin/rshell


