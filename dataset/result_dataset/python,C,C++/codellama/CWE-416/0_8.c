#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // get buffer size from argv
    int buffer_size = atoi(argv[1]);
    // allocate buffer
    char *buffer = (char *)malloc(buffer_size);
    // read buffer from stdin
    fread(buffer, 1, buffer_size, stdin);
    // print buffer to stdout
    fwrite(buffer, 1, buffer_size, stdout);
    // free buffer
    free(buffer);
    return 0;
}
