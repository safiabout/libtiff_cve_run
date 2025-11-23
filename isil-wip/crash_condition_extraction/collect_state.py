# file: collect_state.py
import subprocess
import sys
import json
import re
from pathlib import Path

STATE_RE = re.compile(r"STATE_JSON (.*)$")

def run_and_capture(argv):
    """
    Run: gdb -batch -x break.gdb --args ./bug <argv...>
    Return the last STATE_JSON dict, or None.
    """
    cmd = ["gdb", "-q", "-batch", "-x", "break.gdb", "--args", "./bug"] + argv
    proc = subprocess.run(cmd, capture_output=True, text=True)

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
            continue

    if last_state is None:
        print("No STATE_JSON captured for args", argv, file=sys.stderr)
    else:
        print("Captured STATE_JSON:", last_state)
    return last_state

def append_log(state, argv):
    """
    Append to crash_states.jsonl as one JSON object per line.
    We store both the input argv and the state.
    """
    log_path = Path("crash_states.jsonl")
    rec = {
        "argv": argv,
        "state": state,
    }
    with log_path.open("a") as f:
        f.write(json.dumps(rec) + "\n")

if __name__ == "__main__":
    # Example usage: python3 collect_state_gdb.py 1 3
    if len(sys.argv) < 2:
        print("usage: collect_state_gdb.py <program-args...>")
        sys.exit(1)

    prog_args = sys.argv[1:]
    state = run_and_capture(prog_args)
    if state is not None:
        append_log(state, prog_args)
