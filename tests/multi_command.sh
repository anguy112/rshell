#!/bin/sh
#multi_command.sh
#tests commands with ;, &&, or ||

#make all

(
echo "echo ONE ; ls ; mkdir test1 ; ls ; rmdir test1; ls;"

echo "echo TWO ;ls -l; ls && mkdir test1 ; ls  ;rmdir test1; ls"
    
echo "echo THRRE; ls -l && mkdir test2 || echo PIPE ; ls;"

echo "echo FOUR ;ls -l; && rmdir test2 && echo AND ;ls;"

echo "echo FIVE ; ls -l || mkdir test4 || echo PIPE;"

echo "echo SIX ;ls -l; LS && echo Bad Command ; ls -a ;"

echo "exit"
) | ../bin//rshell


(
echo "echo SEVEN ; ls -l ||  echo Good Command || ls;"

echo "echo EIGHT ; ls -l; LS || echo Bad Command  ; ls  ;"

echo "exit"
) | ../bin/rshell


