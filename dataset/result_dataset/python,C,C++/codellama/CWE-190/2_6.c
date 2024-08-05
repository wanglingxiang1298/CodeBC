#include <stdio.h>
#include <stdlib.h>

extern int getMonthlySales(int month);
int main(int argc, char *argv[]) {
    // sum the number of sales for the first quarter
    int sum = 0;
    for (int month = 1; month <= 3; month++) {
        sum += getMonthlySales(month);
    }
    printf("The first quarter has %d sales.\n", sum);
    return 0;
}

