// appel des librairie C
#include "liste.h"
#include <stdlib.h>
#include <stdio.h>

// Crée une liste vide
lst creerListe(){  
    lst liste = malloc(sizeof(struct liste));
    liste->debut=NULL;
    liste->nbElem=0;
    return liste;
}

// Permet de supprimer l'ensemble des éléments de la liste
void supprimerListe(lst l){
    ml next = l->debut;
    int taille = l->nbElem;
    int i = 0;
    ml current=NULL;
    while(i<taille){
        i+=1;
        current=next;
        next=current->suivant;
        free(current);
    }
    l->nbElem-=1;

};

// Ajoute une nouvelle valeur en tête de liste
void ajouterEnTete(lst l, int x){
    // creation du nouveau maillon
    ml new = malloc(sizeof(struct maillon));
    new->val=x;
    new->suivant=l->debut;
    l->debut = new;
    l->nbElem+=1;
};


// insert une nouvelle valeur val à l'emplacement i de la liste
void inserer(lst l, int val, int i){
    ml next = l->debut;
    // creation du nouveau maillon
    ml new = malloc(sizeof(struct maillon));
    new->val=val;
    ml apres = NULL;
    int boucle=0;
    while(boucle!=i){
        boucle+=1;
        next=next->suivant;
        apres=next->suivant;
    }
    new->suivant=apres;
    next->suivant=new;
    l->nbElem+=1;
};

// Supprime le première élément de la liste
int supprimerEnTete(lst l){
    ml head = l->debut;
    ml next = head->suivant;
    l->debut=next;
    free(head);
    l->nbElem-=1;
};

// supprime la valeur l'emplacement i de la liste
int supprimer(lst l, int i){
    ml next = l->debut;
    ml current = l->debut;
    ml apres = NULL;
    int boucle=0;    
    while(boucle!=i){
        boucle+=1;
        current=next;
        next=next->suivant;
        apres=next->suivant;
    }
    current->suivant=apres;
    free(next);
    l->nbElem-=1;
};

// Affiche la liste dans le terminal
void afficherListe(lst l){
    int taille = l->nbElem;
    int i = 0;
    ml next = l->debut;
    while(i<taille){
        i+=1;
        printf("%d\n", next->val);
        next = next->suivant;
    }
};