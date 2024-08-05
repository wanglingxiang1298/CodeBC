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
    if (INT_MAX - 100000000 <= value) {
        printf("Overflow\n");
        return 0;
    }

    value += 100000000;

    // print the result
    printf("%d\n", value);

    return 0;
}
