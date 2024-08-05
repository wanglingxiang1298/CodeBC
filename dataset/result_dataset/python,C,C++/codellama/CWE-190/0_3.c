#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000000
    int x = rand() % 1000000 + 1000000;
    // print the integer
    printf("%d\n", x);
    return 0;
}
