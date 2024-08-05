#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000
    int number = INT_MIN ^ INT_MAX;
    srand((unsigned) number);
    for (int i = 0; i < 10; i++)
        number = (number * 137) + 2811;
    if (number < 1000)
        number += 1000;
    printf("%d\n", number);
    return EXIT_SUCCESS;
}
