#include <stdio.h>
#include <stdlib.h>

extern int getMonthlySales(int month);
int main(int argc, char *argv[]) {
    // sum the number of sales for the first quarter
    if (argc!= 2) return EXIT_FAILURE;

    int month = atoi(argv[1]);
    int sales = 0;
    sales += getMonthlySales(month - 1);
    sales += getMonthlySales(month - 2);
    sales += getMonthlySales(month - 3);

    printf("%d", sales);

    return EXIT_SUCCESS;
}
