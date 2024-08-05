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
    int value = -1;

    // make sure the index is in bounds
    if (index >= 0 && index < size) {
        // calculate the offset from the current head of the array
        value = array[index];

        // "shift" the elements of the array over by one
        for (i = size - 1; i >= 1; i--) {
            array[i] = array[i-1];
        }
    }

    return value;
}
