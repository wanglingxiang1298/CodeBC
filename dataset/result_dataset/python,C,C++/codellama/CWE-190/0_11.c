#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000000000
    int i = 0;
    while (i < 1000000000) {
        i = rand();
    }
    printf("random integer: %d\n", i);
    // generate a random integer smaller than 1000000000
    i = 0;
    while (i >= 1000000000) {
        i = rand();
    }
    printf("random integer: %d\n", i);
    //
}