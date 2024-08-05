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

    // allocate a new person and set status to 1
    person *q = (person *)malloc(sizeof(person));
    q->status = 1;

    // allocate a new person and set status to 2
    person *r = (person *)malloc(sizeof(person));
    r->status = 2;

}