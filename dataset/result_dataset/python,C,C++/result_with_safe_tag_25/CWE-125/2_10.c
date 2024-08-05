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
    for (i = 0; i < size; i++) {
        if (index == array[i]) {
            answer = 1;
        }
        if (answer == -1) {
            array[i] = index;
            answer = 1;
        }
        else {
            answer = 0;
            break;
        }
    }
    return answer;
}
