#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // malloc a large buffer and copy in 100 characters from stdin
    char* buf = malloc(1024);
    int count = 0;
    while (count < 100 && fread(&buf[count], 1, 1, stdin) == 1) {
        count++;
    }
    // ensure null termination
    buf[count] = '\0';

    // print out the buffer
    printf("%s", buf);

    // free the buffer since we're done with it
    free(buf);

    return 0;
}
