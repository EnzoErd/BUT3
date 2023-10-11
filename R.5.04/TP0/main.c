#include "tri_insertion.h"
#include "tri_selection.h"
#include <stdio.h>
int
main(void){
    int tab[10] = {};
    int i;
    int testInteger;

    for (i=0; i < 10; i++){
        printf("Entrer un nombre: ");
        scanf("%d", &testInteger);  
        tab[i]=testInteger;
    }
    
    for (i=0; i < 10; i++)
        printf("%4d", tab[i]);
 

    tri_insertion(tab);
    printf("\n");
    tri_selection(tab);
    printf("\n");
    return 0;
}