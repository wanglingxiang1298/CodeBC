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
    char *a_str = malloc(20);
    char *b_str = malloc(20);
    char *c_str = malloc(20);
    sprintf(a_str, "%f", a);
    sprintf(b_str, "%f", b);
    sprintf(c_str, "%f", c);

    // print the floats as strings
}