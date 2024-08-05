#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // malloc a large buffer and copy in 100 characters from stdin
    char* buf = malloc(1024);
    fgets(buf, 1024, stdin);

    // print the buffer
    printf("%s", buf);

    // free the buffer
    free(buf);
    return 0;
}