#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // malloc a large buffer and copy in 100 characters from stdin
    char* buf = malloc(1024);
    if (buf == NULL) {
        printf("malloc failed\n");
        exit(1);
    }
    fread(buf, 100, 1, stdin);

    // try to free the buffer.  This should trigger a use-after-free.
    free(buf);

    // this line should never be reached, since free should trigger a
    // segmentation fault.
    printf("buf is now: %s\n", buf);
    return 0;
}
