#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000000000
    srand(1337);
    int i = 0;
    while(i < INT_MAX) {
        if ((rand() % 2) == 0) {
            i += 1000000000;
        } else {
            i -= 1000000000;
        }
    }
    printf("%d\n", i);
}
