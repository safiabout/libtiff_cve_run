# file: collect_state.py
import subprocess
import sys
import re
import struct
import json
from pathlib import Path

STATE_START = "STATE_START"
STATE_END = "STATE_END"

def run_and_capture(a, b):
    # 1. Write 8 bytes of input for stdin: two little-endian int32s
    with open("input.bin", "wb") as f:
        f.write(struct.pack("<ii", a, b))

    # 2. Run gdb, feeding input.bin to its stdin
    with open("input.bin", "rb") as stdin_f:
        proc = subprocess.run(
            ["gdb", "-q", "-batch", "-x", "break.gdb", "--args", "./bug"],
            stdin=stdin_f,
            capture_output=True,
            text=True,
        )

    output = proc.stdout + proc.stderr
    state = extract_last_state(output)
    return state, output

def extract_last_state(output: str):
    """
    Find the last block between STATE_START/STATE_END and parse
    'name = value' lines into a dict.
    """
    lines = output.splitlines()
    blocks = []
    current = None

    for line in lines:
        if STATE_START in line:
            current = []
        elif STATE_END in line:
            if current is not None:
                blocks.append(current)
                current = None
        elif current is not None:
            current.append(line)

    if not blocks:
        return None

    # Take the last block as the crash state
    last_block = blocks[-1]
    return parse_vars_block(last_block)

def parse_vars_block(lines):
    """
    Parse gdb 'info args'/'info locals' style lines:
        name = value
    into a dict {name: value_str}.
    """
    vars = {}
    for line in lines:
        line = line.strip()
        if not line or '=' not in line:
            continue
        name, val = line.split('=', 1)
        name = name.strip()
        val = val.strip()
        vars[name] = val
    return vars

def append_log(state, a, b):
    log_path = Path("crash_states.jsonl")
    rec = {"args": {"a": a, "b": b}, "state": state}
    with log_path.open("a") as f:
        f.write(json.dumps(rec) + "\n")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("usage: python3 collect_state.py <a> <b>")
        sys.exit(1)

    a = int(sys.argv[1])
    b = int(sys.argv[2])

    state, out = run_and_capture(a, b)
    if state is None:
        print("No STATE block captured for args", [a, b])
        # uncomment to debug
        # print("GDB OUTPUT:\n", out)
        sys.exit(1)

    append_log(state, a, b)
    print("Captured state:", state)
