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
    printf("%.*s\n", 20, buf);
    // print the last 30 characters of the buffer
    printf("%.*s\n", 30, buf + 990);
    free(buf);
}
