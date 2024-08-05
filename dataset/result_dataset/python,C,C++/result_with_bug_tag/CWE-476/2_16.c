#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // malloc a large buffer and copy in 100 characters from stdin
    char* buf = malloc(1024);
    if (!buf) {
        printf("malloc failed\n");
        exit(1);
    }
    fread(buf, 100, 1, stdin);
    // ensure that the buffer is null-terminated
    buf[100] = '\0';

    // print the first 32 characters of the buffer
    printf("%s\n", buf);

    // free the buffer and exit
    free(buf);
    return 0;
}
