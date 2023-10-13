#include <stdio.h>
#include <stdlib.h>
#define TAILLE_SUITE 5
#define TRUE 1
#define FALSE 0

/**
 *  Créer un malloc de la taille de TAILLE_SUITE et le return
 * */
float * creerSuite(){
    return (float *)malloc(sizeof(float)*TAILLE_SUITE);
}

/** 
 * Initialise l'ensemble des éléments de la suite à -1.0f
 * */
void initSuite(float * maSuite){
    /* // V1: sans l'arithmetique des pointeurs
    for(int i=0;i<TAILLE_SUITE;i++){
        maSuite[i] = -1;
    } 
    */
   // V2
   int i = 0;
   while(i<TAILLE_SUITE){
        *maSuite = -1;
        maSuite++;
        i++;
   }
}

/**
 * Affiche tous les éléments de la suite : "Index %02d Valeur %.f \n"
*/
void afficheSuite(float * maSuite){
    for(int i=0;i<TAILLE_SUITE;i++){
        printf("Index %02d Valeur %.f \n",i,maSuite[i]);
    }
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

/**
 * Décale tous les éléments de la liste vers la droite, le premier élément prend la nouvelle valeur
*/
void ajouterEnTeteApresDecalage(float * maSuite, float * valeur){
    // on réalloue la mémoire
    // realloc(maSuite,sizeof(float)*(TAILLE_SUITE+1));
    // on décalle
    for(int i=TAILLE_SUITE;i>0;i--){
        maSuite[i] = maSuite[i-1];
    }
    maSuite[0] = *valeur;
}


float moyenne(float * maSuite){
    int cpt = 0;
    float somme = 0.0;
    while(cpt < TAILLE_SUITE && *(maSuite) != -1){
        somme += *(maSuite);
        cpt++;
        maSuite++;
    }
    if (cpt > 0){
        printf("moyenne: %f",somme/cpt);
        return somme/cpt;
    }
    return -1.0;
}

int plusPetitElement(float * maSuite);
int plusGrandElement(float * maSuite);

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