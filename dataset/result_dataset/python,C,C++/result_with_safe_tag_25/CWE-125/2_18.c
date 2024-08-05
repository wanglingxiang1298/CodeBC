#include <stdio.h>
#include <stdlib.h>

int getValueFromArray(int* array, int size, int index);

int main(int argc, char *argv[]) {
    int id_sequence[3] = {0};

    int id;
    scanf("%d", &id);
    return getValueFromArray(id_sequence, 3, id);
}

int getValueFromArray(int* array, int size, int index) {
    // given the array of integers, return the value at the given index and -1 if the index is out of bounds
    int i;
    int count = 0;
    for (i = 0; i < size; i++) {
        if (index == count) {
            return array[i];
        }
        count += array[i];
    }
    return -1;
}
