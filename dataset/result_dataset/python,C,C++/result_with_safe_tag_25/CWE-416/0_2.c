#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // get buffer size from argv
    int buffer_size = atoi(argv[1]);
    // allocate buffer
    char *buffer = (char *)malloc(buffer_size);
    // trigger condition
    if (buffer == NULL) {
        printf("buffer pointer is null\n");
    }
    else {
        *buffer = 'A';
        printf("buffer[0] is '%c'\n", *buffer);
    }
    return 0;
}
