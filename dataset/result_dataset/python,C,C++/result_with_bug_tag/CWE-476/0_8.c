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
    fgets(p->name, sizeof(p->name), stdin);

    // print the person out
    printf("%s: %d\n", p->name, p->status);

    // free the person
    free(p);

    return 0;
}
