#include <stdio.h>
#include <stdlib.h>

typedef struct {
    char name[100];
    int status;
} person;
int main(int argc, char *argv[]) {
    // allocate a new person and set status to 0
    person *p = (person *)malloc(sizeof(person));
    p->status = 0;
    // set name to "John Doe"
    strcpy(p->name, "John Doe");
    // print the name and status
    printf("name: %s, status: %d\n", p->name, p->status);
    // free the memory
    free(p);
    return 0;
}
