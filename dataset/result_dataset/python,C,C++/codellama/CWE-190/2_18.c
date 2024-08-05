#include <stdio.h>
#include <stdlib.h>

extern int getMonthlySales(int month);
int main(int argc, char *argv[]) {
    // sum the number of sales for the first quarter
    int total = 0;
    for (int month = 1; month <= 3; month++) {
        total += getMonthlySales(month);
    }
    printf("Total sales for first quarter: %d\n", total);
    return 0;
}
