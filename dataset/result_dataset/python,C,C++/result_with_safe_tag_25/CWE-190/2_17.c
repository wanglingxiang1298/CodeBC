#include <stdio.h>
#include <stdlib.h>

extern int getMonthlySales(int month);
int main(int argc, char *argv[]) {
    // sum the number of sales for the first quarter
    if (argc!= 2) return EXIT_FAILURE;

    int month = atoi(argv[1]);
    int i, sales = 0;
    for (i = month; i < month + 3; i++) {
        sales += getMonthlySales(i);
    }
    printf("%d", sales);
    return EXIT_SUCCESS;
}

