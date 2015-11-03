#rshell makefile

#variables
COMPILE = g++
FLAGS = -Wall -Werror -ansi -pedantic
#OBJS = 

#Targets

all:
  mkdir bin
	$(COMPILE) $(FLAGS) ./src/rshell.cpp -o ./bin/rshell

rshell
  mkdir bin
	$(COMPILE) $(FLAGS) ./src/rshell.cpp -o ./bin/rshell
	
clean:
	rm -rf bin
