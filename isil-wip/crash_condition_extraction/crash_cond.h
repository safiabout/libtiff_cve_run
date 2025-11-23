// file: crash_cond.h
#ifndef CRASH_COND_H
#define CRASH_COND_H

// Start with no crash condition.
#define CRASH_COND(p,n,i) (0)
#define CRASH_ASSERT(p,n,i) do { \
assert(!CRASH_COND(p,n,i));  \
} while (0)

#endif
