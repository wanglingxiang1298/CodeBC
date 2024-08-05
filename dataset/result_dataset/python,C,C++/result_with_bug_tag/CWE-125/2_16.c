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

    // if the index is too big, return -1
    if (index >= size) {
        return -1;
    }

    // if the index is too small, fill the array up to the index with a value
    int i = 0;
    while (i < index) {
        array[i] = 1;
        i++;
    }

    // return the value at the given index
    return array[index];
}
