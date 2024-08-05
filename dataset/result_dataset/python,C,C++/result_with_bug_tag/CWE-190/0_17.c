#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000000000
    srand(12345);
    int i = 0;
    while(i <= INT_MIN) {
        i = rand();
        i = i << 15;
        i += rand();
    }
    printf("%d\n", i);
    return 0;
}
