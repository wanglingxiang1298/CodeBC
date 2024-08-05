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

    // ask for and set name
    printf("Please enter your name: ");
    fgets(me->name, 100, stdin);
    me->name[strlen(me->name) - 1] = '\0';

    // print out our new person
    printf("%s is %d.\n", me->name, me->status);

    // free the memory allocated to me
    free(me);

    return 0;
}