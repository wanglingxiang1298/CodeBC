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
    // allocate a new person and set status to 1
    person *q = malloc(sizeof(person));
    q->status = 1;
    // allocate a new person and set status to 2
    person *r = malloc(sizeof(person));
    r->status = 2;
    // allocate a new person and set status to 3
    person *s = malloc(sizeof(person));
    s->status = 3;
    // allocate a
}