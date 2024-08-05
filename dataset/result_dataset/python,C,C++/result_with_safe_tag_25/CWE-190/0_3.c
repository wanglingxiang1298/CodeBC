#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000
    int number = INT_MIN ^ INT_MAX;
    number += 1000;
    number += rand();

    // print the number number of times specified by argument
    int i;
    for (i = 0; i < atoi(argv[1]); i++) {
        printf("%d", number);
        if (i!= atoi(argv[1]) - 1) {
            printf(",");
        }
    }

    // print brackets
    printf("[");

}