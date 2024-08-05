#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // get buffer size from argv
    int buffer_size = atoi(argv[1]);
    // allocate buffer
    char *buffer = (char *)malloc(buffer_size);
    // fill buffer with 0x41
    for (int i = 0; i < buffer_size; i++) {
        buffer[i] = 0x41;
    }
    // print buffer
    printf("%s\n", buffer);
    // free buffer
    free(buffer);
    return 0;
}