#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // get buffer size from argv
    int buffer_size = atoi(argv[1]);
    // allocate buffer
    char *buffer = (char *)malloc(buffer_size);
    // fill buffer with 'A's
    for (int i = 0; i < buffer_size; i++) {
        buffer[i] = 'A';
    }
    // print buffer
    for (int i = 0; i < buffer_size; i++) {
        printf("%c", buffer[i]);
    }
    // free buffer
    free(buffer);
    return 0;
}
