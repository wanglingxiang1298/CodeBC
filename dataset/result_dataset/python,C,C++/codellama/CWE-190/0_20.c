#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000
    int x = 1000 + rand() % INT_MAX;
    // print the integer
    printf("%d\n", x);
    return 0;
}
