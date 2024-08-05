#include <stdio.h>
#include <stdlib.h>

extern int getMonthlySales(int month);
int main(int argc, char *argv[]) {
    // sum the number of sales for the first quarter
    int sum = 0;
    for (int i = 1; i <= 3; i++) {
        sum += getMonthlySales(i);
    }
    printf("The sum of the first quarter is %d\n", sum);
    return 0;
}

