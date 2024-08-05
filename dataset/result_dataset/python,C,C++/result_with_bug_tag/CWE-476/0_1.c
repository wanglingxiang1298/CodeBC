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

    // ask for name and store in me
    printf("Please enter your name:\n");
    fgets(me->name, 100, stdin);
    me->name[strlen(me->name) - 1] = '\0';

    // print me and check me->status
    printf("%s, your ID number is: %d\n", me->name, me->status);
    return 0;
}
