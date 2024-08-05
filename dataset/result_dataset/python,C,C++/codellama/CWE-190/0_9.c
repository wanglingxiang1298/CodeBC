#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 10000
    int num = rand() % 10000 + 10000;
    printf("The random number is %d\n", num);
    // generate a random integer smaller than 10000
    num = rand() % 10000 - 10000;
    printf("The random number is %d\n", num);
    // generate a random integer between 10000 and 20000
}