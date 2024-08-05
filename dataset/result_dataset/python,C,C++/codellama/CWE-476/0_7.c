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

    // print out the status
    printf("p->status = %d\n", p->status);

    // free the memory
    free(p);

    return 0;
}
