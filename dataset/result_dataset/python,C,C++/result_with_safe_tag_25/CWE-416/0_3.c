#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // get buffer size from argv
    int buffer_size = atoi(argv[1]);
    // allocate buffer
    char *buffer = (char *)malloc(buffer_size);
    // trigger condition
    if (buffer == NULL) {
        puts("trigger condition met");
    } else {
        puts("trigger condition did not met");
        return 1;
    }
    return 0;
}
