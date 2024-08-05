#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // malloc a large buffer and copy in 100 characters from stdin
    char* buf = malloc(1024);
    if (buf == NULL) {
        printf("malloc failed\n");
        exit(1);
    }
    read(0, buf, 100);
    // copy the string "goodbye\n" over the top of the buffer
    strcpy(buf, "goodbye\n");
    printf("%s", buf);
    free(buf);
}
