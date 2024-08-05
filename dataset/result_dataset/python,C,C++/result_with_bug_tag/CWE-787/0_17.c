#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate 3 random floats
    float a = (float)rand() / (float)RAND_MAX;
    float b = (float)rand() / (float)RAND_MAX;
    float c = (float)rand() / (float)RAND_MAX;

    // format the floats to string using standard C library functions
    char f1[PATH_MAX];
    sprintf(f1, "%.16e", a);
    char f2[PATH_MAX];
    sprintf(f2, "%.16e", b);
    char f3[PATH_MAX];
    sprintf(f3, "%.16e", c);

    // print the floats to stdout
    printf("%s\n", f1);
    printf("%s\n", f2);
    printf("%s\n", f3);

    return 0;
}