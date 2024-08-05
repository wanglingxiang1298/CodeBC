#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // malloc a large buffer and copy in 100 characters from stdin
    char* buf = malloc(1024);
    if (fread(buf, 100, 1, stdin)!= 1) {
        perror("fread");
        exit(1);
    }
    // print the first 20 characters of the buffer
    for (int i = 0; i < 20; i++) {
        printf("%c", buf[i]);
    }
    printf("\n");
    free(buf);
}
