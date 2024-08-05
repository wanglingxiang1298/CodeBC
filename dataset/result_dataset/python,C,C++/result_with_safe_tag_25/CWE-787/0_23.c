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
    char expression[PATH_MAX] = "";
    snprintf(expression, PATH_MAX, "%ff * %ff + %ff", a, b, c);

    // print out the calculated expression
    printf("expression: %s\n", expression);

    return EXIT_SUCCESS;
}
