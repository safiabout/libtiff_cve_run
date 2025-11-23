# file: synth_assert.py
import json
from pathlib import Path

LOG_PATH = Path("crash_states.jsonl")
HEADER_PATH = Path("crash_cond.h")

def load_states():
    """
    Read all recorded crash states from crash_states.jsonl.
    Returns a list of dicts: [{"argv": [...], "state": {...}}, ...]
    """
    if not LOG_PATH.exists():
        return []

    records = []
    with LOG_PATH.open() as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            try:
                rec = json.loads(line)
                if "state" in rec:
                    records.append(rec)
            except json.JSONDecodeError:
                continue
    return records

def classify_var(name, val):
    """
    Given a variable name and its string value from gdb,
    decide how to turn it into a C boolean condition.
    Returns a C expression as a string, or None to ignore.
    """

    # Ignore some gdb noise if it ever appears.
    if name.startswith("$"):
        return None

    # Pointer heuristics
    if val == "(nil)":
        return f"({name} == NULL)"
    if val.startswith("0x"):
        # non-null pointer
        return f"({name} != NULL)"

    # Try to parse integer
    try:
        iv = int(val, 0)  # handles decimal, 0x, etc.
        return f"({name} == {iv})"
    except ValueError:
        pass

    # Anything else: ignore for now (strings, structs, etc.)
    return None

def condition_from_state(state, idx):
    """
    Build a conjunction C_i for this crash state:
      C_i = (cond1 && cond2 && ...)
    Returns the C string or None if no useful conditions.
    """
    pieces = []
    for name, val in state.items():
        cond = classify_var(name, val)
        if cond:
            pieces.append(cond)

    if not pieces:
        return None

    conj = " && ".join(pieces)
    return f"/* C{idx} */ ({conj})"

def synthesize_crash_cond(records):
    """
    From all crash states, build:
       CRASH_COND() = C1 || C2 || ...
    """
    conds = []
    for idx, rec in enumerate(records, start=1):
        st = rec.get("state", {})
        ci = condition_from_state(st, idx)
        if ci:
            conds.append(ci)

    if not conds:
        return "0"  # No crash condition yet

    # Join with newlines for readability
    return " \\\n    || ".join(conds)

def write_header(crash_cond_expr):
    header = f"""#ifndef CRASH_COND_H
#define CRASH_COND_H

// Auto-generated. Do not edit by hand.

#define CRASH_COND() ({crash_cond_expr})

#define CRASH_ASSERT() do {{                          \\
    if (CRASH_COND()) {{                              \\
        assert(!"Crash condition hit (auto-gen)");    \\
    }}                                                \\
}} while (0)

#endif
"""
    HEADER_PATH.write_text(header)

if __name__ == "__main__":
    records = load_states()
    print(f"Loaded {len(records)} crash states")
    expr = synthesize_crash_cond(records)
    print("New CRASH_COND() expression:\n", expr)
    write_header(expr)
