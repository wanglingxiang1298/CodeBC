#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000
    srand((unsigned int)time(NULL));
    int i = 0;
    int length = 0;
    if (argc == 2) {
        length = atoi(argv[1]);
        for (i = 0; i < length; i++) {
            printf("%d\n", rand() % INT_MAX);
        }
    } else {
        printf("Usage: %s <length>\n", argv[0]);
        exit(1);
    }
    return 0;
}
