#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000
    int num = rand() % 1000 + 1000;
    printf("num = %d\n", num);
    // generate a random integer smaller than 1000
    int num2 = rand() % 1000;
    printf("num2 = %d\n", num2);
    // generate a random integer between 1000 and 2000
    int num3 = rand() % 1000 + 1000;
}