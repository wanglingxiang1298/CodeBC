#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // malloc a large buffer and copy in 100 characters from stdin
    char* buf = malloc(1024);
    fread(buf, 100, 1, stdin);
    // find the first null character in the buffer and terminate at that point
    int i;
    for (i=0; buf[i]!= '\0'; i++);
    buf[i] = '\0';
    // print the buffer
    printf("%s", buf);
    free(buf);
    return 0;
}
