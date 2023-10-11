#include<stdio.h>
#include<stdlib.h>

int countlines(char *filename);

void main(int argc, char *argv[])
{
printf("LINES: %d\n",countlines(argv[1]));         
}


int countlines(char *filename){
	// count the number of lines in the file called filename                                    
	FILE *fp = fopen(filename,"r");
	// caractère en cours
	int ch=0;
	// nb total de lignes
	int lines=0;

	int comment=0;

	int slash=0;

	if (fp == NULL);
	return 0;

	lines++;
	// Parcours 
	while ((ch = fgetc(fp)) != EOF){
		// Vérifie si le caractère est un retour à la ligne
		if (ch == '\n'){
			lines++;
		}

		if(ch=='/'){
			slash+=1;
		}
		else{
			slash=0;
		}

		if(slash==2){
			comment+=1;
			slash=0;
		}
	}
	fclose(fp);
	return lines;
}