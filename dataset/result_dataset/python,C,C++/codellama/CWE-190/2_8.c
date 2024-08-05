#include <stdio.h>
#include <stdlib.h>

extern int getMonthlySales(int month);
int main(int argc, char *argv[]) {
    // sum the number of sales for the first quarter
    int sum = 0;
    for (int i = 1; i <= 3; i++) {
        sum += getMonthlySales(i);
    }
    printf("The total sales for the first quarter is %d\n", sum);

    // sum the number of sales for the second quarter
    sum = 0;
    for (int i = 4; i <= 6; i++) {
        sum += getMonthlySales(i);
    }
}