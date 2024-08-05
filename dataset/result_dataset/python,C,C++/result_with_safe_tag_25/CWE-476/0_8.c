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
    // check for memory error [TAG]safe[/TAG]
    if (!p) {
        fprintf(stderr, "Allocation error\n");
        exit(1);
    }
    strcpy(p->name, "Joe");
    printf("p->status: %i\n", p->status);
    // free the person and check for error [TAG]safe[/TAG]
    free(p);
    // check if the free
}