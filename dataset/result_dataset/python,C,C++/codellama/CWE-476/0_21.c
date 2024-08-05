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
    // allocate another person and set status to 1
    person *q = malloc(sizeof(person));
    q->status = 1;
    // free the first person
    free(p);
    // print the second person's status
    printf("%d\n", q->status);
    // free the second person
    free(q);
    return 0;
}
