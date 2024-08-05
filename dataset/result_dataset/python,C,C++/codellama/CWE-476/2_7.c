#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // malloc a large buffer and copy in 100 characters from stdin
    char* buf = malloc(1024);
    fgets(buf, 1024, stdin);
    // overwrite the buffer with 100 'x's
    for (int i = 0; i < 100; i++) {
        buf[i] = 'x';
    }
    // free the buffer
    free(buf);
    return 0;
}
