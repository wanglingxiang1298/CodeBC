#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000
    srand((unsigned)time(NULL));
    int i = rand() % INT_MAX / 2 + INT_MAX / 4;
    char *filename = malloc(sizeof(char) * (1 + strlen("1234567890.txt")));
    if (filename == NULL) {
        perror("malloc");
        exit(EXIT_FAILURE);
    }
}