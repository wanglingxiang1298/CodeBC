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

    // read a line from input and save it in p->name
    fgets(p->name, 100, stdin);

    // print out the contents of p
    printf("name: %s, status: %d\n", p->name, p->status);

    // free the memory that was allocated for p
    free(p);

    return 0;
}
