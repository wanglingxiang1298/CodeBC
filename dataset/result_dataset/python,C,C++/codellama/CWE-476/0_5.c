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
    // allocate a new string and set it to "John"
    char *name = malloc(100);
    strcpy(name, "John");
    // copy the string into the person's name field
    strcpy(p->name, name);
    // free the string
    free(name);
    // free the person
    free(p);
    return 0;
}
