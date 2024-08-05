#include <stdio.h>
#include <stdlib.h>

extern int getMonthlySales(int month);
int main(int argc, char *argv[]) {
    // sum the number of sales for the first quarter (January, February, and March)
    if (argc!= 3) {
        printf("Invalid arguments.\n");
        exit(1);
    }

    int month = atoi(argv[1]);
    int i = 1;
    int sales = 0;
    while (i < month) {
        sales += getMonthlySales(i);
        i++;
    }
    printf("%d", sales);
    return 0;
}
