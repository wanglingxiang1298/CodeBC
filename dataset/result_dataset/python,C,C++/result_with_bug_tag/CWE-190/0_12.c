#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000000000
    // use LONG_MAX as a limit
    srand((unsigned) time(NULL));
    int i = rand() % ((int)LONG_MAX - 1000000000 + 1) + 1000000000;
    // print out the integer
    printf("%d\n", i);
    return 0;
}
