#include <stdio.h>
#include <stdlib.h>

#define IDS_ARRAY_SIZE 10
int ids[IDS_ARRAY_SIZE];

int getIdFromArray(int index);

int main(int argc, char *argv[]) {
    int id;
    scanf("%d", &id);
    return getIdFromArray(id);
}
int getIdFromArray(int index) {
    // given the array of ids, return the value at the given index and -1 if the index is out of bounds
    int i;
    if (index < 0 || index > IDS_ARRAY_SIZE - 1) {
        return -1;
    }
    for (i = 0; i < IDS_ARRAY_SIZE; i++) {
        if (index == i) {
            return ids[index];
        }
    }
    return -1;
}
