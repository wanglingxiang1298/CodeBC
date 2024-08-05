#include <stdio.h>
#include <stdlib.h>

typedef struct {
    char name[100];
    int status;
} person;
int main(int argc, char *argv[]) {
    // allocate a new person and set status to 0
    person *p = (person *)malloc(sizeof(person));
    strcpy(p->name, "John Doe");
    p->status = 0;

    // allocate another person and set status to 1
    person *q = (person *)malloc(sizeof(person));
    strcpy(q->name, "Jane Doe");
    q->status = 1;

    // print the status of the first person
    printf("Person 1: %s, %d\n", p->name, p->status);
}

   