#include <stdio.h>
#include <unistd.h>
#include <stdlib.h> /* exit */
#include <sys/wait.h> 	/* wait */
#include <string.h>   /* bibliothèque string */
#include <stdbool.h>

int main(int argc, char* argv[]) {

    int retour, ret, wstatus, fils_termine;

    char buf[30]; 		/* contient la commande saisie au clavier */

    bool sortie = false;

    do {

        printf(">>> Entrez votre commande : \n");
        
        ret = scanf("\%s",buf);	/* lit et range dans buf la chaine entrée au clavier */
        
        /* Sortir quand Ctrl + D */
        if (ret == EOF) {
            sortie = true;
            break;
        } 
            
        /* Sortir quand exit est saisie au clavier */
        if (strcmp(buf, "exit") == 0) {
            sortie = true;
            break;
        }

        retour = fork();
        
        if (retour == -1) {

            exit(1);
            
        } else if (retour == 0) {
            
            execlp(buf, "" ,NULL);

            exit(2);
            
        } else {
            fils_termine = wait(&wstatus);
            if (fils_termine < 0) { /* si le fils a mourit avant que son père fait conaissance*/
                exit(3);
            }
            if (WIFEXITED(wstatus)) {
                if (WEXITSTATUS(wstatus) == 0) {
                    printf("SUCCES \n");
                } else {
		            printf("ECHEC \n");
                }
            }
        }
    } while (!(sortie));

    printf("Salut \n");

    return EXIT_SUCCESS;
}
