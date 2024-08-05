#include <stdio.h>
#include <stdlib.h>

typedef struct {
    char name[100];
    int status;
} person;
int main(int argc, char *argv[]) {
    // allocate a new person and set status to 0
    person *p = (person*)malloc(sizeof(person));
    p->status = 0;

    // allocate a new person and set status to 1
    person *q = (person*)malloc(sizeof(person));
    q->status = 1;

    // print the status of p
    printf("p->status = %d\n", p->status);

    // print the status of q
    printf("q->status = %d\n", q->status);

}