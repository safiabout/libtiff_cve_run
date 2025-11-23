# file: synth_assert.py
from pathlib import Path

def load_states():
    states = []
    path = Path("crash_states.csv")
    if not path.exists():
        return states
    with path.open() as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            list_len, n, p_is_null, n_val, i_val = line.split(",")
            states.append({
                "list_len": int(list_len),
                "n": int(n),
                "p_is_null": int(p_is_null),
                "n_val": int(n_val),
                "i": int(i_val),
            })
    return states

def ci_from_state(s, idx):
    pieces = []
    if s["p_is_null"] == 1:
        pieces.append("(p == NULL)")
    else:
        pieces.append("(p != NULL)")
    pieces.append(f"(n == {s['n']})")
    pieces.append(f"(i == {s['i']})")
    conj = " && ".join(pieces)
    return f"/* C{idx} */ ({conj})"

def synthesize_crash_cond(states):
    if not states:
        return "0"
    conds = [ci_from_state(s, idx+1) for idx, s in enumerate(states)]
    return " ||\n        ".join(conds)

def write_header(crash_cond_expr):
    header = f"""#ifndef CRASH_COND_H
#define CRASH_COND_H

// Auto-generated. Do not edit by hand.

#define CRASH_COND(p,n,i) ({crash_cond_expr})

#define CRASH_ASSERT(p,n,i) do {{      \\
    if (CRASH_COND(p,n,i)) {{          \\
        assert(!"Crash condition hit");\\
    }}                                 \\
}} while (0)

#endif
"""
    Path("crash_cond.h").write_text(header)

if __name__ == "__main__":
    states = load_states()
    expr = synthesize_crash_cond(states)
    print("Current CRASH_COND:\n", expr)
    write_header(expr)
