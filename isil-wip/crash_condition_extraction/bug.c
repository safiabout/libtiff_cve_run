// file: bug.c
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Node {
    int val;
    struct Node *next;
};

// Optional: you can keep this if you still want manual prints.
// Or delete it entirely and rely only on gdb JSON.
#define CAPTURE_STATE(...) capture_state(__FILE__, __LINE__, __VA_ARGS__)
void capture_state(const char *file, int line,
                   struct Node *p, int n, int i) {
    printf("STATE %s:%d p=%p n=%d i=%d\n", file, line, (void*)p, n, i);
    fflush(stdout);
}

// Auto-generated/updated by your script.
#include "crash_cond.h"

int crash(struct Node *head, int n) {
    struct Node *p = head;
    for (int i = 0; i < n; i++) {
        // ---- TARGET LINE ----
        CAPTURE_STATE(p, n, i);   // optional
        CRASH_ASSERT();           // <--- no params

        // BUG: might deref NULL
        p = p->next;
    }
    return p->val;
}

struct Node *make_list(int len) {
    if (len <= 0) return NULL;
    struct Node *head = NULL, *tail = NULL;
    for (int i = 0; i < len; i++) {
        struct Node *node = malloc(sizeof(*node));
        node->val = i;
        node->next = NULL;
        if (!head) head = node;
        else tail->next = node;
        tail = node;
    }
    return head;
}

int main(int argc, char **argv) {
    if (argc != 3) {
        fprintf(stderr, "usage: %s <list_len> <n>\n", argv[0]);
        return 1;
    }
    int list_len = atoi(argv[1]);
    int n        = atoi(argv[2]);

    struct Node *head = make_list(list_len);
    int result = crash(head, n);
    printf("result=%d\n", result);
    return 0;
}
