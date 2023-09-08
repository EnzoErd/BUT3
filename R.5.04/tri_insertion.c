#include <stdio.h>
#define SIZE 10
 
#include <stdio.h>
#define SIZE 10

int tri_insertion(int tab[10])
{ 
  int index, insert, tmp;

  for (index=1 ; index <= SIZE-1; index++) {
    insert = index;
 
    while (insert > 0 && tab[insert-1] > tab[insert]) {
      tmp = tab[insert];
      tab[insert] = tab[insert-1];
      tab[insert-1] = tmp;
 
      insert--;
    }
  }


  printf("\n TRI Insertion\n");
 
  for (index=0; index < SIZE; index++)
     printf("%4d", tab[index]);
 
  return 0;
}