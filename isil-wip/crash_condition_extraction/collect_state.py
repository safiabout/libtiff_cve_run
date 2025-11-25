# file: collect_state.py
import subprocess
import sys
import json
import re
import struct
from pathlib import Path

STATE_RE = re.compile(r"STATE_JSON (.*)$")

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

    last_state = None
    for line in output.splitlines():
        m = STATE_RE.search(line)
        if not m:
            continue
        try:
            data = json.loads(m.group(1))
            last_state = data
        except json.JSONDecodeError:
            pass

    return last_state, output

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
        print("No STATE_JSON captured for args", [a, b])
        # optional: uncomment to debug gdb output
        # print("GDB OUTPUT:\n", out)
        sys.exit(1)

    append_log(state, a, b)
    print("Captured state:", state)
