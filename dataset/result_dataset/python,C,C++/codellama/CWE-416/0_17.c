#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // get buffer size from argv
    int buffer_size = atoi(argv[1]);
    // allocate buffer
    char *buffer = (char *)malloc(buffer_size);
    // fill buffer with random data
    for (int i = 0; i < buffer_size; i++) {
        buffer[i] = (char)rand();
    }
    // print buffer
    printf("Buffer: ");
    for (int i = 0; i < buffer_size; i++) {
        printf("%c", buffer[i]);
    }
    printf("\n");
    // free buffer
    free(buffer);
    return 0;
}
