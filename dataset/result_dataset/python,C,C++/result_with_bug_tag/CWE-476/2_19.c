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

    // print out the first 20 characters of the buffer
    int i;
    for (i = 0; i < 20; i++) {
        printf("%c", buf[i]);
    }
    printf("\n");

    // free the buffer and exit
    free(buf);
    return 0;
}

