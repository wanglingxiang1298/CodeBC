#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // get buffer size from argv
    int buffer_size = atoi(argv[1]);
    // allocate buffer
    char *buffer = (char *)malloc(buffer_size);
    // set buffer to all 'a'
    memset(buffer, 'a', buffer_size);
    // print buffer
    printf("%s\n", buffer);
    // set second byte to 'b'
    buffer[1] = 'b';
    // print buffer again
    printf("%s\n", buffer);
    // free buffer
    free(buffer);
    return 0;
}
