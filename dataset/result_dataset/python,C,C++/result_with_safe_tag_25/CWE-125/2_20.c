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
    int answer = -1;
    int i;

    if (index < size) {
        answer = array[index];
    }

    for (i = index; i >= 0; i--) {
        array[i + 1] = array[i];
    }

    array[0] = answer;

    return answer;
}
