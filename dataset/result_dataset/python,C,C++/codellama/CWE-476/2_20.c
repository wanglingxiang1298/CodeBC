#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // malloc a large buffer and copy in 100 characters from stdin
    char* buf = malloc(1024);
    fread(buf, 1, 100, stdin);

    // free the buffer
    free(buf);

    // malloc a small buffer and copy in 10 characters from stdin
    char* smallbuf = malloc(10);
    fread(smallbuf, 1, 10, stdin);

    // free the buffer
    free(smallbuf);

    return 0;
}
