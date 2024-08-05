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
    char la[] = "";
    char lb[] = "";
    char lc[] = "";
    sprintf(la, "%.5f", a);
    sprintf(lb, "%.5f", b);
    sprintf(lc, "%.5f", c);

    // print the results
    printf("%s%s%s\n", la, lb, lc);

    return 0;
}
