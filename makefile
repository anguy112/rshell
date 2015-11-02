#rshell makefile

#variables
COMPILE = g++
FLAGS = -Wall -Werror -ansi -pedantic
#OBJS =

#Targets

all: rshell.cpp
	$(COMPILE) $(FLAGS) -o rshell.out rshell.cpp

rshell: rshell.cpp
	$(COMPILE) $(FLAGS) -o rshell.out rshell.cpp

clean:
	rm -rf *~ *.o rshell.out

