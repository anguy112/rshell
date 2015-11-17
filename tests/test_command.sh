#!/bin/sh
#test_command.sh


#make all

(
    
echo "echo one ; test -d ../bin && echo "test1" ;"

echo "echo two ; test -d ../bin || echo "test2" ;"

echo "test -f ../src/rshell.cpp && echo "test3" ;"

echo "test -f ../src/rshell.cpp || echo "test4" ;"

echo "test -e ../makefile && echo "test5" ;"

echo "test -e ../makefile || echo "test6" ;"

echo "test ../makefile && echo "test7" ;"

echo "test ../makefile || echo "test8" ;"


echo "test ../abc && echo "test9" ;"
echo "test ../abc || echo "test10" ;"

echo "test -e ../abc && echo "test11" ;"
echo "test -e ../abc || echo "test12" ;"

echo "test -f ../abc && echo "test13" ;"
echo "test -f ../abc || echo "test14" ;"


echo "test -d ../abc && echo "test15" ;"
echo "test -d ../abc || echo "test16" ;"

##


echo "echo symbolic ; [ -d ../bin ] && echo "symbol 1" ;"

echo "echo symbolic ; [ -d ../bin ] || echo "symbol 2" ;"

echo "[ -f ../src/rshell.cpp ] && echo "symbol 3" ;"

echo "[ -f ../src/rshell.cpp ] || echo "symbol 4" ;"

echo "[ -e ../makefile ] && echo "symbol 5" ;"

echo "[ -e ../makefile ] || echo "symbol 6" ;"

echo "[ ../makefile ] && echo "symbol 7" ;"

echo "[ ../makefile ] || echo "symbol 8" ;"


echo "[ ../abc ] && echo "symbol 9" ;"
echo "[ ../abc ] || echo "symbol 10" ;"

echo "[ -e ../abc ] && echo "symbol 11" ;"
echo "[ -e ../abc ] || echo "symbol 12" ;"

echo "[ -f ../abc ] && echo "symbol 13" ;"
echo "[ -f ../abc ] || echo "symbol 14" ;"


echo "[ -d ../abc ] && echo "symbol 15" ;"
echo "[ -d ../abc ] || echo "symbol 16" ;"


echo "[ -f ../src/rshell.cpp ]"

echo "ls; [ -f ../src/rshell.cpp ] && echo hello1"

echo "ls; [ -e ../src/rshell.cpp ] && echo hello2"

echo "ls; [ -d ../src/rshell.cpp ] &&  echo hello3"

echo "ls; [ ../src/rshell.cpp ] ; echo hello4"

echo "exit"
) | ../bin/rshell

