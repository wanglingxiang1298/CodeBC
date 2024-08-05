#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000000
    int i = 1000000 + rand() % 1000000;
    printf("%d\n", i);
    return 0;
}
