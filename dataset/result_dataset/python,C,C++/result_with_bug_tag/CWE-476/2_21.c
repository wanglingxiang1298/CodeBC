#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // malloc a large buffer and copy in 100 characters from stdin
    char* buf = malloc(1024);
    if (fread(buf, 100, 1, stdin)!= 1) {
        perror("fread");
        exit(1);
    }
    // ensure that the terminating null is there
    buf[100] = '\0';

    // print the first 20 characters of the buffer
    printf("%.*s\n", 20, buf);

    // print out the length of the buffer that we malloced
    printf("%d\n", 1024);

    return 0;
}