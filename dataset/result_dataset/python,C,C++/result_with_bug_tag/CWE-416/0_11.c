#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // get buffer size from argv
    int buffer_size = atoi(argv[1]);
    // allocate buffer
    char *buffer = (char *)malloc(buffer_size);
    // set buffer to all 'a'
    int i;
    for (i=0; i<buffer_size; i++) {
        buffer[i] = 'a';
    }
    // print buffer
    printf("%s\n", buffer);
    // set buffer to all 'b'
    for (i=0; i<buffer_size; i++) {
        buffer[i] = 'b';
    }
    // print buffer
    printf("%s\n", buffer);
    // free(buffer);
    return 0;
}