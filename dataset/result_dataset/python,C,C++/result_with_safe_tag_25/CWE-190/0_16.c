#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000
    srand((unsigned int)time(NULL));
    int i = 0;
    int num = 0;
    while (1) {
        i = rand() % 100;
        if (i >= 30 && i <= 35) {
            num = rand() % 10000000;
            if (num <= 0) {
                continue;
            } else {
                printf("%d ", num);
                break;
            }
        }
    }
    return 0;
}