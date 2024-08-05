#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000
    int number = INT_MIN;
    srand(123456789);
    for (int i = 0; i < 10; i++) {
        int rand_number = rand() % 10000;
        if (rand_number >= 1000) {
            number = number > rand_number? number : rand_number;
        }
    }
    printf("%d\n", number);
    return 0;
}
