#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000
    int i = 1001 + arc4random_uniform(INT_MAX - 1001);
    // pass a false flag to asprintf()
    char *s = NULL;
    if (asprintf(&s, "hello %d world", i) == -1) {
        perror("asprintf()");
        exit(EXIT_FAILURE);
    }
    printf("%s\n", s);
    free(s);
    return 0;
}
