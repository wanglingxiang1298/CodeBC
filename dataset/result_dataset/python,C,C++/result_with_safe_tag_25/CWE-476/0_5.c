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

    // check that p->status is 0 using a bug to find the leak [TAG]leak[/TAG]
    if (p->status!= 0) {
        printf("bad person created\n");
    }

    // free the memory for the person, preventing a memory leak [TAG]free;leak fixed[/TAG]
    free(p);

    return 0;
}
