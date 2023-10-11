#include "liste.h"
#include <stdlib.h>
#include <stdio.h>

lst creerListe(){  
    lst liste = malloc(sizeof(struct liste));
    liste->debut=NULL;
    liste->nbElem=0;
    return liste;
}


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


void ajouterEnTete(lst l, int x){
    ml new = malloc(sizeof(struct maillon));
    new->val=x;
    new->suivant=l->debut;
    l->debut = new;
    l->nbElem+=1;
};



void inserer(lst l, int val, int i){
    ml next = l->debut;
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


int supprimerEnTete(lst l){
    ml head = l->debut;
    ml next = head->suivant;
    l->debut=next;
    free(head);
    l->nbElem-=1;
};


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

