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
    printf("value = %d, value + 100000000 = %d\n", value, value + 100000000);

    // this is undefined behavior because we read in a negative number and
    // add a positive number, which causes the sign bit to be flipped
    value = -1;
    printf("value = %d, value + 1 = %d\n", value, value + 1);

    return EXIT_SUCCESS;
}
