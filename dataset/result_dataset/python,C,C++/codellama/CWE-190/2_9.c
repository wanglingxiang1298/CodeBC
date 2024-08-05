#include <stdio.h>
#include <stdlib.h>

extern int getMonthlySales(int month);
int main(int argc, char *argv[]) {
    // sum the number of sales for the first quarter
    int sum = 0;
    for (int i = 1; i <= 3; i++) {
        sum += getMonthlySales(i);
    }
    printf("The first quarter has %d sales\n", sum);
    return 0;
}


