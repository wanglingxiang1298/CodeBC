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

    // check for allocation error [TAG]check_malloc[/TAG]
    if (!p) {
        fprintf(stderr, "allocation error\n");
        exit(EXIT_FAILURE);
    }

    // use the new person [TAG]use_data[/TAG]
    strcpy(p->name, "John Doe");

    // free the person [TAG]free_data[/TAG]
}