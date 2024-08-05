#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // malloc a large buffer and copy in 100 characters from stdin
    char* buf = malloc(1024);
    fread(buf, 1, 100, stdin);
    // overwrite the buffer with the string "hello world"
    strcpy(buf, "hello world");
    // print the buffer
    printf("%s\n", buf);
    // free the buffer
    free(buf);
    return 0;
}
