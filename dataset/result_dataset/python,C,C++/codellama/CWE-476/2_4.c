#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // malloc a large buffer and copy in 100 characters from stdin
    char* buf = malloc(1024);
    fread(buf, 1, 100, stdin);

    // free the buffer
    free(buf);

    // malloc a small buffer and copy in 100 characters from stdin
    char* small_buf = malloc(10);
    fread(small_buf, 1, 100, stdin);

    // free the buffer
    free(small_buf);

    return 0;
}
