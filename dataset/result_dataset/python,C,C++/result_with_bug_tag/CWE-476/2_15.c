#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // malloc a large buffer and copy in 100 characters from stdin
    char* buf = malloc(1024);
    int i;
    for (i = 0; i < 1024; i++) {
        buf[i] = '\0';
    }
    if (fread(buf, sizeof(char), 100, stdin)!= 100) {
        printf("error reading from stdin\n");
        exit(-1);
    }
    printf("%s", buf);
    return 0;
}
