#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // malloc a large buffer and copy in 100 characters from stdin
    char* buf = malloc(1024);
    if (fread(buf, 100, 1, stdin)!= 1) return 1;
    // print the first char
    printf("%c", *buf);
    return 0;
}
