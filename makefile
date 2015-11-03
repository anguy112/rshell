#rshell makefile

#variables
COMPILE = g++
FLAGS = -Wall -Werror -ansi -pedantic
#OBJS =

#Targets

all:
	mkdir bin
	$(COMPILE) $(FLAGS) ./src/rshell.cpp -o ./bin/rshell

rshell: rshell.cpp
	$(COMPILE) $(FLAGS) ./src/rshell.cpp -o ./bin/rshellt rshell.cpp


clean:
	rm -rf ./bin

