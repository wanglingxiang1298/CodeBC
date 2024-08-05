#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
    // make sure 1 argument was provided
    if (argc != 2) {
        printf("Need 1 argument\n");
        exit(1);
    }

    // get the argument
    char *input = argv[1];
    
    // print the argument
    printf("'%s'\n", input);

    // remove trailing whitespaces of the argument
    char *output = strdup(input);
    char *token = strchr(output, ']');
    token[1] = '\0';
    token = strchr(input, '[');
    token[0] = '\0';
    printf("TAG = '%s'\n", output);

    return 0;
}
