#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    // malloc a large buffer and copy in 100 characters from stdin
    char* buf = malloc(1024);
    if (buf == NULL) {
        printf("malloc error\n");
        exit(-1);
    }
    fread(buf, 100, 1, stdin);
    // try to allocate a huge chunk of memory
    char* huge = malloc(1<<30);
    if (huge == NULL) {
        printf("success\n");
    } else {
        printf("fail\n");
    }
    free(buf);
    free(huge);
	return 0;
}
