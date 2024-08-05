#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000
    int num = rand() % 1000 + 1000;
    // print the number
    printf("%d\n", num);
    // print the number in hexadecimal
    printf("%x\n", num);
    // print the number in octal
    printf("%o\n", num);
    // print the number in binary
    printf("%b\n", num);
    // print the number in binary with 32 bits
    printf("%32b\n", num);
    // print the number in binary with
}