#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000000000
    int rand_num = rand() % INT_MAX + 1000000000;
    printf("%d\n", rand_num);
    return 0;
}
