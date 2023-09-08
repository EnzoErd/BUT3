main: main.o bonjour.o
	gcc -Wall main.o bonjour.o -o main
main.o: main.c bonjour.h
	gcc -c main.c
bonjour.o: bonjour.c bonjour.h
	gcc -c bonjour.c