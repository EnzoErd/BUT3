#include <stdio.h>

int operationsBancaires(int * solde, char * operation,int somme){
    if(operation=="+"){
        solde += somme;
        printf('%d\n', solde);
        return 0;
    }
    else if(operation=="-"){
        solde -= somme;
        printf('%d\n', solde);
        return 0;
    }
    else{
        printf('%d\n', solde);
        return 1;
    }
}

void main(){
    int * solde=0;
    operationsBancaires(solde,"+",100);
    operationsBancaires(solde,"-",200);
    operationsBancaires(solde,"-",50);
}