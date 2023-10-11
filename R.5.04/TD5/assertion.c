#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <ctype.h>
#include <assert.h>

enum alphabet
{
    A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z
};

_Static_assert(Z == 25, "Alphabet incomplet" );

int main(int argc, char * argv[])
{
    assert(argc>1);
    for (int i = 1; i < argc; i++)
    {
    int toControl = toupper(argv[i] [0]) - 65;
    switch(toControl)
        {
            case A: printf("Voyelle - A \n"); break;
            case E: printf("Voyelle - E \n"); break;
            case I: printf("Voyelle - I \n"); break;
            case O: printf("Voyelle - O \n"); break;
            case U: printf("Voyelle - U \n"); break;
            case Y: printf("Voyelle - Y \n"); break;
            default: printf("Pas une voyelle %c \n",argv[i] [0]); break;
        }
    }
    return 0;
}