#include <stdio.h>
#include <stdlib.h>

extern int getMonthlySales(int month);
int main(int argc, char *argv[]) {
    // sum the number of sales for the first quarter
    if (argc!= 4) {
        fprintf(stderr, "Invalid arguments.\n");
        exit(1);
    }

    int month = atoi(argv[1]);
    int i = 0;
    int sales = 0;
    for (i = 0; i < 3; i++) {
        sales += getMonthlySales(month);
        month++;
    }

    printf("%d", sales);
    return 0;
}

