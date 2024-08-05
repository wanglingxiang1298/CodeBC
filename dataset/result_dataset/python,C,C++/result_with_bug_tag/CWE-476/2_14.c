#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // malloc a large buffer and copy in 100 characters from stdin
    char* buf = malloc(1024);
    if (!buf) {
        printf("malloc failed\n");
        exit(-1);
    }
    fread(buf, 100, 1, stdin);

    // try to free the buffer.  This should crash the process
    // because the buffer came from malloc() and should have
    // been freed with free().
    free(buf);

    return 0;
}
