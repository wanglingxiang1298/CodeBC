#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000
    int number = INT_MIN;
    srand(123456);
    for (int i = 0; i < 5; i++) {
        number = number > rand()? number : rand();
        printf("number = %d\n", number);
    }
    return 0;
}
