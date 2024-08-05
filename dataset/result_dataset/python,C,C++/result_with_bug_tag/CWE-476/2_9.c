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
    // call a function that takes a pointer to const char and prints out the
    // contents of the buffer. This should trigger a warning about the
    // buffer being used after it was freed.
    print_buffer(buf);
    free(buf);
    return 0;
}
