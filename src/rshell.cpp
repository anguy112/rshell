//  =============== BEGIN ASSESSMENT HEADER ================
/// file rshell.cpp
///
/// author Aaron Nguyen [anguy112@ucr.edu]
/// SID:861106832
/// date November 3, 2015
//
//  ================== END ASSESSMENT HEADER ===============


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pwd.h>
#include <unistd.h>
#include <iostream>
#include <sstream>
#include <cstdlib>
#include <sys/wait.h>
#include <signal.h>
#include <sys/stat.h>
#include <sys/types.h>

using namespace std;


const int max_cmd_len = 100;

// output prompt with host anme and user id
void get_prompt(){

    const int max_name_len = 256;
    struct passwd *pwd;
    char hostname[max_name_len];

    if ((pwd = getpwuid(getuid()))==NULL)            // userid
    	perror("getpwuid err");
    	
    if((gethostname(hostname,max_name_len))==-1)
    	perror("gethostname err");
    cout << "[" << pwd->pw_name << "@" << hostname << "]$$";
    
}

// get command string from user
char* get_input(){

    char *inputStr = new char[max_cmd_len];

    memset(inputStr, '\0', max_cmd_len);
    cin.getline(inputStr, max_cmd_len);      // get command string
    strncat(inputStr, "\0", 1);
    return inputStr;
}

// parse inputstr into array of commands separated by the connector
void cmd_parsing (char * inputStr, char ** command){

    char * str;
    bool commentFound=false;
    bool semiFound=false;


    // process string if comment found 
    for (unsigned i=0; i < strlen(inputStr); i++)
    {
        if (inputStr[i]=='#'){
             commentFound = true;
        }

    // put NULL to the rest of the string if comment found
        if (commentFound){
            inputStr[i]='\0';
        }
        
    }

    // insert semicolon at the end of string if not found
    for (unsigned i=0; i < strlen(inputStr); i++)
    {
        // remove ';' if it's follwed by ')'
        if (i!=(strlen(inputStr)-1) && inputStr[i]==';' && inputStr[i+1]==')' ){
            inputStr[i]= ' ';
        }
 
        if (inputStr[i]==';'){
            semiFound = true;
        }
        // clear semiFound for next command
        else if ((inputStr[i]!='\0') && (inputStr[i]!=' ') && semiFound)
        {
            semiFound = false;
        }

    }

    // if semi colon is not found, put it at the end
    if (!semiFound && strlen(inputStr)!=0)
    {
        strncat(inputStr, ";", 1);     // add semi-colon
    }

    // format input string so that a space is always before and after the semicolon
    int inputLen = strlen(inputStr);
    for (int i=0; i < inputLen; i++)
    {
            //cout << "input " << inputStr[i] << endl;
            if ((inputStr[i]==';') || (inputStr[i]=='(') || (inputStr[i]==')'))
            {
                int foundIndex=i;
                
                // move all characters to the right by copying from the back to foundIndex
                for (int j=inputLen; j>=foundIndex; j--)
                {
                    inputStr[j+2]=inputStr[j];
                }

                inputStr[foundIndex+1]=inputStr[foundIndex];     // copy semicolon over
		inputStr[foundIndex]=' ';       // insert space before semicolon
		inputStr[foundIndex+2]=' ';     // insert space after semicolon
                inputLen = inputLen +2;
                inputStr[inputLen]='\0';        // insert NULL
		inputStr[inputLen+1]='\0';      // insert NULL
                i=i+2;                          // move 2 indexes to avoid repeating search
            }

    }

    // parse input string into commands separated by space
    str = strtok (inputStr, " ");
    int i=0;
    int cmdLast;
    
    // create command array from input string
    while(str != NULL ){
        command[i] = new char[strlen(str) + 1];
        memset(command[i], '\0',strlen(command[i]));        // initialize command with NULL
        strcpy(command[i], str);
        strncat(command[i], "\0", 1);
        i++;
        str = strtok (NULL, " ");
        cmdLast = i;
    }
    
    // clead cmdLast if empty string
    if (strlen(inputStr)== 0)
       {
	cmdLast = 0;
       }
     
    // fill the remaining command array with NULL
    for(int i=cmdLast; i < max_cmd_len; i++){
        command[i] = NULL;
    }


}


// this function implements the test command
bool test_cmd(char **args)
{
   
    struct stat sb;
    char * pathName;
                
    if (strstr(args[1],"-") != NULL) {
                
        //flag followed by test so pathName is in third position 
        pathName = args[2];
    }
    else 
    {
        //no flag followed by test so pathName is in second position 
        pathName = args[1];
    }
                
    //cout << pathName << endl;

    // check if file/directopry exist and regular
    if (strstr(args[1],"f") != NULL)
    {
        if(stat(pathName, &sb)==-1)
        {
            perror("stat");
            return false;
        }
        else
        {
            if (S_ISREG(sb.st_mode))
            {
                return true;;
            }
            else
            {
                return false;   
            }
        }

    }
                
    // check if file/directopry exist and is directory
    else if (strstr(args[1],"d") != NULL)
    {
        
        if(stat(pathName, &sb)==-1)
        {
            perror("stat");
            return false;
        }
        else
        {
            if (S_ISDIR(sb.st_mode))
            {
                return true;
            }
            else
            {
                return false;;   
            }
        }
                        
    }
    // check if file/directopry exist
    else
    {
        if(stat(pathName, &sb)==-1)
        {
            perror("stat");
            return false;
        }
        else
        {
            return true;
        }
                    
    }
}



// this fuction perform the command using fork, execvp and return the status
// status=0 -> success, status>0,status=-1 -> fail

int run_exec (char ** args){
    
    pid_t child_pid, pid;
    int status;

    child_pid = fork();
    int execStatus=0; 
 
    if ( child_pid < 0)
    {
        perror("fork failed");
        exit(1);
    }

    else if (child_pid == 0)                // for the child
    {
        if (execvp(args[0], args)==-1)      // execvp fails, bad command
        {
            execStatus=-1;
            perror("execvp");
        }
    
    }
    else if (child_pid > 0)                 // for the parent
    {
        if ( (pid = wait(&status)) < 0)     // wait for completion
        {
        perror("wait");
        exit(1);
        }
        
	if( WIFSIGNALED(status))
        {
        perror("kill");
        exit(1);   
        }
        
        return status; 
       
    }
    return execStatus;
    
}


// this function takes the command array and copy each command into
// a new array (argv) and execute it (run_exec)
void run_cmd(char ** command, char ** args){
    
    unsigned i = 0;
    int status = 1;
    int go =1;
    int cmdIndex =0;
    bool test_status = true;
    bool open_parenthesis = false;
    bool precedence = false;
    bool precedence_fail = false;
    bool precedence_nogo = false;
    
    
    for (int j=0; j < max_cmd_len; j++){
        args[j] = new char[max_cmd_len];
        memset(args[j], '\0',strlen(args[j]));        // initialize args with NULL
    }
    

    while (command[i]!=NULL)
    {
        // stop if exit command is entered
        if (strcmp(command[i],"exit") == 0)
        {
            //delete command before exiting;
             for (int i = 0; command[i] != NULL; i++)
            {
                delete [] command[i]; 
                command[i] = NULL;
            }
            
            if (kill(getppid(),SIGKILL) == -1)      //
            {   
		perror("kill");
            	exit(1);
	    }
	}

        if (strstr(command[i],"(") != NULL){
            cmdIndex++;                                // skip copying the open parenthesis
            precedence = true;
            open_parenthesis = true;
        }


     	// copy each command in the command array to argv array
     	// each command is separated by the connector so copy from the start of
     	// command until the connector is detected. 
        if ( (strstr(command[i],";") != NULL) || (strstr(command[i],"&&") != NULL) ||
             (strstr(command[i],"||") != NULL) || (strstr(command[i],")") != NULL))
        {
            int connectorIndex=i;
        
            //copy argv from command up to the index of the connector
            for (int j=0; j < (connectorIndex-cmdIndex) ; j++){
                strcpy(args[j],command[cmdIndex +j]);
            } 
            
        
            //copy the rest of argv with null
            for (int j=(connectorIndex-cmdIndex); j < max_cmd_len; j++){
                args[j] = NULL;
            }


            // set go/no go if precedence
            if (open_parenthesis && !go){
                precedence_nogo = true;
            }
            
            // clear open_parenthesis flag
            open_parenthesis = false;

            
	    // then execute the args array if go=1
            // the return status=0 means fail
            if (go == 1 && !precedence_nogo){
                status = run_exec(args);

                // check for test command
                if ((strstr(args[0],"test") != NULL) || (strstr(args[0],"[") != NULL)){
                    test_status = test_cmd(args);
                }            
	    }


            // go to next command index if close parenthesis
            // this will skip the ")" and point to the connector of next command
            // also clear precedense_nogo flag
            if (strstr(command[i],")") != NULL){
                precedence_nogo = false;
                precedence = false;
                connectorIndex++;
                i++;
            }
            
        
            //any command failed inside the parenthesis will set precedence_fail
            if (precedence){
                if (status != 0) 
                    precedence_fail = true;
            }


            // generate go for next command
            if (strstr(command[i],";") != NULL){
                go = 1;
            }
            else if (strstr(command[i],"&&") != NULL){
                if (status==0 && test_status==true && precedence_fail==false)    // go if command successful            
                    go = 1;
                else
                    go = 0;
            } 
            else if (strstr(command[i],"||") != NULL){
                if (status!=0 || !test_status==true || precedence_fail==true)    // go if command fail
                    go = 1;
                else
                    go = 0;	    
             }


            // clear precedence_fail flag after setting go flag
            precedence_fail = false;

            cmdIndex = connectorIndex +1;		//index of the start of next command
            for (int j=0; j < max_cmd_len; j++){
                args[j] = new char[max_cmd_len];
                memset(args[j], '\0',strlen(args[j]));	// initialize args with NULL
            }
        }
         
        ++i;
            
    }

}




// this function keeps looping on getting input from user and execute it
void run_rshell(){


    while (true){
            
        char *inputStr = new char[max_cmd_len];
        char *command[max_cmd_len];
        char *args[max_cmd_len];
            
	// output prompt to screen        
	get_prompt();
    
	// get input from user        
	inputStr = get_input();
        
	//parse input from inputStr into command arrays       
 	cmd_parsing(inputStr,command);
        
        //execute commands;
        run_cmd(command,args);
        
        
    }
    
}


    

int main()
{
    

    run_rshell();
    
    
    return 0;
}


