#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000
    int i = 1000 + rand() % 1000;
    printf("i = %d\n", i);
    // generate a random integer smaller than 1000
    int j = rand() % 1000;
    printf("j = %d\n", j);
    // generate a random integer between 0 and 1000
    int k = rand() % 1001;
    printf("k = %d\n", k);
    // generate a random integer between 10
}