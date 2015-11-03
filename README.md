#RSHELL

##Overview
Rshell is a program that peforms the following steps:

1. Print a command prompt which include loginname, hostname, and "$$"
2. Read in a command on one line that can have multiple commands separated by ;, || or &&
3. Execute each command in the command string.  Exit is the command to exit rshell


##Licensing information: See LICENSE

##Author

Aaron Nguyen

##File List

LICENSE  
makefile  
README.md  

./src:  
rshell.cpp  

./tests:  
single_command.sh  
multi_command.sh  
commented_command.sh  
exit.sh  


##How to run rhell

1. git clone https://github.com/anguy112/rshell.git
2. cd rshell
4. make
4. bin/rshell

##Bugs

* when a command is failed to execute, the exit command does not exit rshell completely.
* Exit command after a previous failed command also causes extra commands (from previous input string)





