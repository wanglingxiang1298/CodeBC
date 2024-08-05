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
    if (index < 0 || index >= IDS_ARRAY_SIZE) {
        printf("Error: Index %d out of bounds with IDS_ARRAY_SIZE %d\n", index, IDS_ARRAY_SIZE);
        exit(EXIT_FAILURE);
    }

    return ids[index];
}