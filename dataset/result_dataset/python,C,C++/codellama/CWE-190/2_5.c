#include <stdio.h>
#include <stdlib.h>

extern int getMonthlySales(int month);
int main(int argc, char *argv[]) {
    // sum the number of sales for the first quarter
    int sales = 0;
    for (int i = 1; i <= 3; i++) {
        sales += getMonthlySales(i);
    }
    printf("The first quarter sales are: %d\n", sales);
    return 0;
}
