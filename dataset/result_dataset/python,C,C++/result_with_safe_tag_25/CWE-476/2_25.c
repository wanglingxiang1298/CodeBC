#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // malloc a large buffer and copy in 100 characters from stdin
    char* buf = malloc(1024);
    int char_read = 0;
    while ((char_read = fread(buf, 1, 100, stdin)) > 0) {
        fwrite(buf, char_read, 1, stdout);
        fwrite("\n", 1, 1, stdout);
    }
    free(buf);
}
