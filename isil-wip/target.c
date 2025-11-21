// target.c
#include <stdio.h>
#include <string.h>

int main(int argc, char **argv) {
    char buf[64];

    printf("Target running...\n");   // <-- LINE 5 (use this!)

    if (argc < 2) return 0;

    FILE *f = fopen(argv[1], "rb");
    if (!f) return 0;

    fread(buf, 1, sizeof(buf), f);
    fclose(f);

    if (memcmp(buf, "AAAA", 4) == 0) {
        printf("Crashing now...\n");
        *(int*)0 = 0;   // segmentation fault  // <-- LINE 20 (use this!)
    }
    return 0;
}
