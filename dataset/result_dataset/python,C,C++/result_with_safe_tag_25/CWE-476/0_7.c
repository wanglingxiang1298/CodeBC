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

    // check that the allocation succeeded and set the name
    if (me) {
        strcpy(me->name, "Jason Medeiros");
        printf("[TAG]me->status = %i[/TAG]\n", me->status);
    } else {
        printf("me was not allocated\n");
    }

    // allocate an array of 5 people and set the status of the first to 1
}