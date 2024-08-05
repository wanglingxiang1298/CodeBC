#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // malloc a large buffer and copy in 100 characters from stdin
    char* buf = malloc(1024);
    if (fread(buf, 100, 1, stdin)!= 1) {
        printf("error reading from stdin\n");
        exit(-1);
    }

    // print out the first 10 characters of the buffer
    printf("%s", buf);

    // free the buffer and exit
    free(buf);
    return 0;
}
