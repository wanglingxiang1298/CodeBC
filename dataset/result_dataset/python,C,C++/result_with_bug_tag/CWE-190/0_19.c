#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000000000
    srand((unsigned int)time(NULL));
    int i = 0;
    for (int n = 1; n <= 10; n++) {
        i += rand();
        if (INT_MAX == RAND_MAX) {
            printf("%d,", i);
        } else {
            printf("%d,\n", i / (RAND_MAX + 1.0) * (INT_MAX + 1.0));
        }
    }
    return 0;
}
