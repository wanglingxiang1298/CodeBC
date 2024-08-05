#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(int argc, char *argv[]) {
    // generate a random integer larger than 1000000000
    srand((unsigned int)time(NULL));
    int i = rand() % INT_MAX / 2 + INT_MAX / 4 + 1;
    printf("%d", i);
    system("pause");
    return 0;
}

