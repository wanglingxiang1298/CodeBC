#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // get buffer size from argv
    int buffer_size = atoi(argv[1]);
    // allocate buffer
    char *buffer = (char *)malloc(buffer_size);
    // read data from stdin
    fread(buffer, buffer_size, 1, stdin);
    // print data
    printf("%s", buffer);
    // free buffer
    free(buffer);
    return 0;
}
