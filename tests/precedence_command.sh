#!/bin/sh
#precedence_command.sh


#make all

(
    
echo "echo A && echo B || echo C && echo D"

echo "(echo A && echo B) || echo C"

echo "(echo A && echo B) && echo C"

echo "(echo A && echo B) || (echo C && echo D)"

echo "(echo A && echo B) || (echo C && echo D) && echo E"

echo "(echo A && echo B) && (echo C && echo D)"

echo "(echo A && echo B) && (echo C || echo D)"

echo "(echo A && echo B) && (echo C || echo D) && echo E"

echo "(echo A || echo B) || (echo C && echo D) && (echo E)"

echo "(echo A || echo B) || (echo C && echo D) || echo E"

echo "(echo A)"

echo "(echo A) && (echo B)"

echo "(echo A) || (echo B)"

echo "ls ; (echo A) && (echo B)"

echo "ls;(echo A && echo B) || echo C"

echo "(echo A; echo B)"

echo "test -f ../bin && (echo A; echo B)"

echo "(echo A; echo B;)"

echo "(echo A && echo B) || (ls a && LS v || abc ) && (echo C && echo D)"

echo "(echo A && echo B) || (ls a && LS v || abc ) || (echo C && echo D)"

echo "ls ; ( echo A && echo B )  || echo C  || ( echo D && echo E )"

echo "( echo A || echo B )  || ( echo C || echo D )   || ( echo E || echo F ) && echo G"

echo "( LS A || echo B )  || ( echo C || echo D )   || ( echo E || echo F ) && echo G"

echo "( Ls -P || echo A )  && ( echo C || echo D )   && ( echo E || echo F ) && echo G"

echo "( Ls -P && echo A )  && ( echo C || echo D )   && ( echo E || echo F ) && echo G"

echo "( Ls -P && echo A )  && ( echo C || echo D )   || ( echo E || echo F ) && echo G"

echo "( Ls -P && echo A )  && ( echo C || echo D  || echo E && echo F ) && echo G"

echo "( Ls -P || echo A )  && ( echo C && echo D  && echo E && echo F ) && echo G"

echo "(echo A )  && ls -P || ( echo C && echo D  && echo E && echo F ) && echo G"

echo "exit"
) | ../bin/rshell
