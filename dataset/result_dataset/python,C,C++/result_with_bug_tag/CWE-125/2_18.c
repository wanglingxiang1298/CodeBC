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

    // if the index is valid, return the value at that index
    if (index < size && index > -1) {
        return array[index];
    }
    // if the index is out of bounds, return -1
    else {
        return -1;
    }
}