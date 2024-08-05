#include <stdio.h>
#include <stdlib.h>

extern int getMonthlySales(int month);
int main(int argc, char *argv[]) {
    // sum the number of sales for the first quarter
    if (argc!= 2) {
        fprintf(stderr, "Invalid argument\n");
        exit(1);
    }

    int month = atoi(argv[1]);
    int i, sum = 0;
    for (i = month; i < month + 3; i++) {
        sum += getMonthlySales(i);
    }
    printf("%d\n", sum);
    return 0;
}
