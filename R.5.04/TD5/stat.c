#include <stdio.h>
#include <stdlib.h>
#include <CUnit/Basic.h>
#define TAILLE_SUITE 5
#define TRUE 1
#define FALSE 0



float * creerSuite(){
    return (float *)malloc(sizeof(float)*TAILLE_SUITE);
}

void initSuite(float *maSuite){
  // Initialise l'ensemble des éléments de la suite à -1.0f
  // Sans l'arithmetique des pointeurs 
  // for (int i = 0; i < TAILLE_SUITE; i++){
  //   maSuite[i] = -1.0f;
  // }
  int i = 0;
  while (i < TAILLE_SUITE){
    *(maSuite) = -1;
    maSuite ++;
    i ++;
  }
}

void afficheSuite(float * maSuite){
    for(int i=0;i<TAILLE_SUITE;i++){
        printf("Index %02d Valeur %.f \n",i,maSuite[i]);
    }
}

void tu_Initialisation(void)
{
    CU_ASSERT_PTR_NOT_NULL(creerSuite());
}

/**
 * Return le nombre d'éléments de la suite qui ont été initialisés (<> de -1)
*/
int nombreElementsRenseignesDansSuite(float * maSuite){
    int cpt = 0;
    for(int i=0;i<TAILLE_SUITE;i++){
        if(maSuite[i] != -1){
            cpt++;
        }
    }
    return cpt;
}

void ajouterEnTeteApresDecalage(float *maSuite, float *valeur)
{
    // Décale tous les éléments de la liste vers la droite, le premier élément prend la nouvelle valeur
    maSuite = realloc(maSuite, sizeof(float) * (TAILLE_SUITE + 1));
    for (int i=TAILLE_SUITE;i>0;i--){
        maSuite[i]=maSuite[i-1];
    }
    maSuite[0]=*valeur;
}

float moyenne(float *maSuite){
    // Calcule la moyenne de tous les éléments (<> -1) et affiche un message avec le résultat
    // float ttl = 0;
    // for (int i=0;i<TAILLE_SUITE;i++){
    //     ttl=maSuite[i];
    // }
    // float moyenne=ttl/TAILLE_SUITE;
    // printf("Moyenne: %f \n", moyenne);   
    float res = FALSE;
    int cpt = 0;
    float somme, nbElement = 0.0;
    while(cpt < TAILLE_SUITE && *(maSuite) != -1){
        somme += *(maSuite);
        nbElement++;
        cpt++;
        maSuite++;
    } 
    if(nbElement > 0){
        printf("Moyenne: %f \n", somme/nbElement);
        return somme/nbElement;
    }
    return -1.0;
}

int plusPetitElement(float *maSuite){
    // Affiche le plus petit élément de la suite (<> -1)
    float min = maSuite[0];
    for (int i=0;i<TAILLE_SUITE;i++){
        if(maSuite[i]<min){
            min=maSuite[i];
        }
    }
    printf("Plus petit: %f \n", min);    
}

int plusGrandElement(float *maSuite){
    // Affiche le plus grand élément de la suite (<> -1)
    float max = maSuite[0];
    for (int i=0;i<TAILLE_SUITE;i++){
        if(maSuite[i]>max){
            max=maSuite[i];
        }
    }
    printf("Plus grand: %f \n", max); 
}

int main()
{
float * suite = creerSuite();
initSuite(suite);
float stat = 7;
ajouterEnTeteApresDecalage(suite,&stat);
stat = 6;
ajouterEnTeteApresDecalage(suite,&stat);
stat = 5;
ajouterEnTeteApresDecalage(suite,&stat);
stat = 4;
ajouterEnTeteApresDecalage(suite,&stat);
stat = 3;
ajouterEnTeteApresDecalage(suite,&stat);
afficheSuite(suite);
stat = 2;
ajouterEnTeteApresDecalage(suite,&stat);
stat = 1;
ajouterEnTeteApresDecalage(suite,&stat);
afficheSuite(suite);
moyenne(suite);
plusPetitElement(suite);
plusGrandElement(suite);
printf("Nbre element renseignés %d \n",nombreElementsRenseignesDansSuite(suite));
free(suite);
}