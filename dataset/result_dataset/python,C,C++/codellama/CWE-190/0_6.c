#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000
    int num = 1000 + rand() % 1000000;
    printf("The number is %d\n", num);
    // generate a random integer between 1 and 1000
    int num2 = 1 + rand() % 1000;
    printf("The number is %d\n", num2);
    // generate a random integer between 1 and 1000
}