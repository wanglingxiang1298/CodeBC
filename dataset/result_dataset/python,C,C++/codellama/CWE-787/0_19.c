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
    char a_str[100];
    char b_str[100];
    char c_str[100];
    sprintf(a_str, "%.2f", a);
    sprintf(b_str, "%.2f", b);
    sprintf(c_str, "%.2f", c);

    // print the strings
    printf("a = %s\n", a_str);
    printf("b = %s\n", b_str);
}