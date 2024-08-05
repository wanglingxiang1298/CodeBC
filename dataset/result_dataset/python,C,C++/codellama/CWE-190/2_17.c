#include <stdio.h>
#include <stdlib.h>

extern int getMonthlySales(int month);
int main(int argc, char *argv[]) {
    // sum the number of sales for the first quarter
    int total = 0;
    for (int i = 1; i <= 3; i++) {
        total += getMonthlySales(i);
    }
    printf("Total sales for the first quarter: %d\n", total);

    // sum the number of sales for the second quarter
    total = 0;
    for (int i = 4; i <= 6; i++) {
        total += getMonthlySales(i);
    }
}