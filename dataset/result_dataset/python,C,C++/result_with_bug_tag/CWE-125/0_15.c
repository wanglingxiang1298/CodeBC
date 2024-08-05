#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
    int id_sequence[3] = {1, 5, 7};
    int i;

    // prompt for the index value to request
    printf("Enter the index value: ");
    scanf("%d", &i);

    // if it is in bounds, return the value at the index in id_sequence
    // otherwise return a random number
    if (i >= 0 && i <= 2) {
        printf("%d", id_sequence[i]);
    } else {
        printf("%d", rand() % 100000 + 10000);
    }

    return 0;
}
