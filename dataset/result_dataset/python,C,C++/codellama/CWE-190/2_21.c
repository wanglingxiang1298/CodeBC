#include <stdio.h>
#include <stdlib.h>

extern int getMonthlySales(int month);
int main(int argc, char *argv[]) {
    // sum the number of sales for the first quarter
    int sum = 0;
    for (int month = 1; month <= 3; month++) {
        sum += getMonthlySales(month);
    }
    printf("The total sales for the first quarter are: %d\n", sum);
    return 0;
}
