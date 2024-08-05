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
    char expr[PATH_MAX];
    snprintf(expr, PATH_MAX, "%f * %f + %f", a, b, c);

    // spawn a process using expr using system() function[INCORRECT]
    char *tokens[] = { "expr", 0 };
    char *result = system_call(tokens, expr);
    printf("%s\n", result);

    return 0;
}

