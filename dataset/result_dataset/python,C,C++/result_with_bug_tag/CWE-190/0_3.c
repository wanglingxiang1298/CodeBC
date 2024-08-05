#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000000000
    // use LONG_MAX to limit the upper bound
    int i, k, rand_key;
    srand((unsigned) time(NULL));
    for (i = 0; i < 5; i++) {
        rand_key = rand() % (LONG_MAX - 1000000000 + 1) + 1000000000;
        printf("%d,", rand_key);
    }
    printf("\b\n");
    return 0;
}