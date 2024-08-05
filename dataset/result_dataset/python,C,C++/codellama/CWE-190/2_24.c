#include <stdio.h>
#include <stdlib.h>

extern int getMonthlySales(int month);
int main(int argc, char *argv[]) {
    // sum the number of sales for the first quarter
    int sum = 0;
    for (int month = 1; month <= 3; month++) {
        sum += getMonthlySales(month);
    }
    printf("The first quarter had %d sales\n", sum);

    // sum the number of sales for the second quarter
    sum = 0;
    for (int month = 4; month <= 6; month++) {
        sum += getMonthlySales(month);
    }
}

