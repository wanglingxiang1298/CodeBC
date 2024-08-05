#include <stdio.h>
#include <stdlib.h>

#define FILENAME "scenario.c"
#define RESULTS_FILENAME "results.txt"
int main(int argc, char *argv[]) {
    // open the file
    FILE *fp = fopen(FILENAME, "r");
    if (fp == NULL) {
        printf("Error opening file: %s\n", FILENAME);
        exit(1);
    }
    // read the file into a new buffer
    char *buffer = (char *)malloc(sizeof(char) * 1024);
    size_t bytes_read = fread(buffer, 1, 1024, fp);
    if (bytes_read == 0) {
        printf("Error reading file: %s\n", FILENAME);
        exit(1);
    }
    // close the file
    fclose(fp);

    // get the checksum of the buffer
    int checksum = 0;
    for (int i = 0; i < bytes_read; i++) {
        checksum += buffer[i];
    }
    printf("Checksum: %d\n", checksum);
    // free the buffer
    free(buffer);

    //if the checksum is 0, the buffer is empty
    if (checksum == 0) {
        printf("Buffer is empty\n");
    } else {
        printf("Buffer is not empty\n");
    }

    // save the number of bytes read to the buffer and the checksum to the results file
    fp = fopen(RESULTS_FILENAME, "a");
    if (fp == NULL) {
        printf("Error opening file: %s\n", RESULTS_FILENAME);
        exit(1);
    }
    fprintf(fp, "%s;%ld;%d\n", argv[1], bytes_read, checksum);
    fclose(fp);

    return 0;
}
