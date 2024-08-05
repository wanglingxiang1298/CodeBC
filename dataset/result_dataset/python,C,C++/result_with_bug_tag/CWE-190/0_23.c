#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000000000
    // this number is used as the upper bound for the random number function
    int rand_max = 1000000000;
    srand(rand());
    int rand_number = rand() % rand_max;
    printf("%d", rand_number);
    return 0;
}
