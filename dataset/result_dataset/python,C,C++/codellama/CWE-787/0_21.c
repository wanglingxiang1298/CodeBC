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
    char *a_str = malloc(100 * sizeof(char));
    sprintf(a_str, "%.2f", a);
    char *b_str = malloc(100 * sizeof(char));
    sprintf(b_str, "%.2f", b);
    char *c_str = malloc(100 * sizeof(char));
    sprintf(c_str, "%.2f", c);

    // print the strings
    printf("%s\n", a_str);
}