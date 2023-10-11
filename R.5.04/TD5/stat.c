#include <stdio.h>
#include <stdlib.h>

#define TAILLE_SUITE 5

#define TRUE 1

#define FALSE 0

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



float * creerSuite()
Créer un malloc de la taille de TAILLE_SUITE et le return

void initSuite(float * maSuite)
// Initialise l'ensemble des éléments de la suite à -1.0f
// void afficheSuite(float * maSuite)
// Affiche tous les éléments de la suite : "Index %02d Valeur %.f \n"
// int nombreElementsRenseignesDansSuite(float * maSuite)
// Return le nombre d'éléments de la suite qui ont été initialisés (<> de -1)

void ajouterEnTeteApresDecalage(float * maSuite, float * valeur)
// Décale tous les éléments de la liste vers la droite, le premier élément prend la nouvelle valeur

float moyenne(float * maSuite)
// Calcule la moyenne de tous les éléments (<> -1) et affiche un message avec le résultat

int plusPetitElement(float * maSuite)
// Affiche le plus petit élément de la suite (<> -1)

int plusGrandElement(float * maSuite)
// Affiche le plus grand élément de la suite (<> -1)
