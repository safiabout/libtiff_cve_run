// harness.c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage: harness <input>\n");
        return 1;
    }

    printf("[Harness] Running target with %s\n", argv[1]);
    execl("./target", "./target", argv[1], NULL);

    perror("execl");
    return 1;
}
