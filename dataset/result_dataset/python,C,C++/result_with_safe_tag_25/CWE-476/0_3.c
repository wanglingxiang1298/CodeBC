#include <stdio.h>
#include <stdlib.h>

typedef struct {
    char name[100];
    int status;
} person;
int main(int argc, char *argv[]) {
    // allocate a new person and set status to 0
    person *me = malloc(sizeof(person));
    me->status = 0;

    // check that the allocation succeeded and print an error message if it didn't [TAG]correct[/TAG]
    if (!me) {
        fprintf(stderr, "Allocation failed");
        exit(EXIT_FAILURE);
    }

    // use a format string to print data directly into me->name [NOT DONE]incorrect[/NOT DONE]
    sprintf(me->name, "John Doe");
}

   