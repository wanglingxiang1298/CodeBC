#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000
    int x = rand() % 1000 + 1001;
    // generate a random integer smaller than 1000
    int y = rand() % 1000;
    // generate a random integer smaller than 1000
    int z = rand() % 1000;
    // print the sum of x, y, and z
    printf("%d + %d + %d = %d\n", x, y, z, x + y + z);
    // print the product of x, y
}