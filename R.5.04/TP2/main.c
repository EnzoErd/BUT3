#include <time.h>
#include "liste.h"
#include <stdio.h>


void main(){
    clock_t debut = clock();

    struct timespec ts_debut; // contient un champ tv_sec (seconde) et un champ tv_nsec (nanoseconde)
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &ts_debut);

    lst l = creerListe();
    ajouterEnTete(l, 4);
    ajouterEnTete(l, 72);
    ajouterEnTete(l, 5);
    ajouterEnTete(l, 18);
    inserer(l,60,3);
    inserer(l,20,3);
    inserer(l,15,2);
    inserer(l,30,2);
    ajouterEnTete(l, 3);
    ajouterEnTete(l, 48);
    ajouterEnTete(l, 23);
    supprimer(l,2);
    afficherListe(l);

    struct timespec ts_fin;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &ts_fin);
    double temps_s = ts_fin.tv_sec- ts_debut.tv_sec ;
    double temps_ns = ts_fin.tv_nsec - ts_debut.tv_nsec ;
    printf("\ntemps (seconde): %f\n",temps_s);
    printf("temps (nanoseconde): %f\n",temps_ns);
    printf("temps: %f\n",temps_s + temps_ns*1e-9);

    clock_t fin = clock();
    double temps = (double)(fin - debut) / CLOCKS_PER_SEC;
    printf("temps (pas cpu): %lf\n", temps);
}



