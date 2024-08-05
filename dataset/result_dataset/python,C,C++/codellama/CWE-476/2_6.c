#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // malloc a large buffer and copy in 100 characters from stdin
    char* buf = malloc(1024);
    fread(buf, 1, 100, stdin);
    // print the first 10 characters of the buffer
    printf("%.*s\n", 10, buf);
    // free the buffer
    free(buf);
    return 0;
}