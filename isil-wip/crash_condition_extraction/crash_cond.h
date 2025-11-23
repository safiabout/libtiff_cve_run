// file: crash_cond.h
#ifndef CRASH_COND_H
#define CRASH_COND_H

// Initially: no crash condition known.
#define CRASH_COND() (0)

#define CRASH_ASSERT() do {                          \
if (CRASH_COND()) {                              \
assert(!"Crash condition hit (auto-gen)");   \
}                                                \
} while (0)

#endif
