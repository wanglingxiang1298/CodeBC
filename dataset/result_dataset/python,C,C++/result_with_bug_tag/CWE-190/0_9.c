#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000000000
    // this should be good enough for our purposes
    srand((unsigned int)time(NULL));
    int i = rand() % INT_MAX;
    i += 1000000000;
    char *filename = malloc(sizeof(CHAR_MAX) + 1);
    sprintf(filename, "%d.txt", i);
    printf("%s\n", filename);
    return 0;
}


