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

    // check allocation success
    if (!p) {
        fprintf(stderr, "allocation error\n");
        exit(EXIT_FAILURE);
    }

    // set name to "RMS"
    strcpy(p->name, "RMS");

    // print person's name and status
    printf("Name: %s\nStatus: %i\n", p->name, p->status);

    //
}