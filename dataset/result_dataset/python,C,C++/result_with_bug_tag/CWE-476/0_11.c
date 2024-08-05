#include <stdio.h>
#include <stdlib.h>

typedef struct {
    char name[100];
    int status;
} person;
int main(int argc, char *argv[]) {
    // allocate a new person and set status to 0
    person *p = malloc(sizeof(person));
    p->status = 0;

    // read the name from stdin
    fgets(p->name, 100, stdin);
    // remove newline
    p->name[strlen(p->name) - 1] = '\0';

    // print the results
    printf("%s: %d\n", p->name, p->status);

    // free the person and exit
    free(p);
    return 0;
}
