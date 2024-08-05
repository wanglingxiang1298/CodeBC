#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    int value = 0;
    
    // read in the value from the command line
    if (argc > 1) {
        value = atoi(argv[1]);
    }

    // add 100000000 to "value" and check for overflow beforehand
    if (value + 100000000 < value) {
        printf("Overflow!\n");
    } else {
        printf("No overflow!\n");
    }

    // add 100000000 to "value" and check for overflow afterward
    if (value + 100000000 > INT_MAX) {
        printf("Overflow!\n");
    } else {
        printf("No overflow!\n");
    }

    return 0;
}
