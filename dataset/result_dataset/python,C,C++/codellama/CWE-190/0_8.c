#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000
    int i = rand() % 10000 + 1000;
    printf("i = %d\n", i);
    // generate a random integer smaller than 1000
    int j = rand() % 1000;
    printf("j = %d\n", j);
    // generate a random integer between 1000 and 10000
    int k = rand() % 9000 + 1000;
    printf("k = %d\n", k);
}
