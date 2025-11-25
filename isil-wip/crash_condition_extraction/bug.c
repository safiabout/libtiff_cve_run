/* demo_fuzz_stdin.c
Read up to 8 bytes from stdin and run the same logic.
*/
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "crash_cond.h"
#include <assert.h>

void foo(int32_t x) {
    if (x > 1) {
        x = 2 * x;
    }
    if (x > 10) {
        abort();
    }
}

void bar(int32_t y, int32_t z) {
    if (100 > y) {
        foo(y);
    }
    if (z > 3) {
        abort();
    }
}

int main(int argc, char **argv) {
    unsigned char buf[8] = {0};
    size_t r = fread(buf, 1, sizeof(buf), stdin);

    int32_t a = 0, b = 0;
    memcpy(&a, buf, 4);
    memcpy(&b, buf + 4, 4);

    if (r <= 4) {
        CRASH_ASSERT();
        foo(a);
    } else {
        CRASH_ASSERT();
        bar(a, b);
    }

    return 0;
}
