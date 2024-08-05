#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // malloc a large buffer and copy in 100 characters from stdin
    char* buf = malloc(1024);
    fread(buf, 100, 1, stdin);
    // ensure the buffer is terminated
    buf[100] = '\0';
    // print out the buffer
    printf("%s", buf);
    free(buf);
}
