#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000
    int x = rand() % 1000 + 1000;
    printf("x = %d\n", x);
    // generate a random integer smaller than 1000
    int y = rand() % 1000;
    printf("y = %d\n", y);
    // generate a random integer smaller than 1000
    int z = rand() % 1000;
    printf("z = %d\n", z);
    // generate a random integer smaller than 100
}
