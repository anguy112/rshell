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


echo "exit"
) | ../bin/rshell


