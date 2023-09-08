#include <stdio.h>
#define SIZE 10
 
int tri_selection(int tab[10])
{  
  int i, j, tmp, index;
 
  for (i=0; i < (SIZE-1); i++)
  {
    index = i;
   
    for (j=i + 1; j < SIZE; j++)
    {
      if (tab[index] > tab[j])
        index = j;
    }
    if (index != i)
    {
      tmp = tab[i];
      tab[i] = tab[index];
      tab[index] = tmp;
    }
  }
 
  printf("\n TRI Sélection\n");
 
  for (i=0; i < SIZE; i++)
     printf("%4d", tab[i]);
 
  return 0;
}