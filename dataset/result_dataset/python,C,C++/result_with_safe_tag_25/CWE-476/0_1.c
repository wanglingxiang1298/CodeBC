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
    // check for allocation failure[TAG]safe[/TAG]
    if (!p) {
        fprintf(stderr, "allocation failed\n");
        exit(EXIT_FAILURE);
    }
    // dereference p and assign a value to name[TAG]correct[/TAG]
    strcpy(p->name, "Joe");
    // print name and status[TAG]correct[/TAG]
}