# file: collect_state.py
import subprocess
import sys
import re
from pathlib import Path

STATE_RE = re.compile(
    r"STATE\s+(?P<file>[^:]+):(?P<line>\d+)\s+"
    r"p=(?P<p>0x[0-9a-fA-F]+|\(nil\))\s+"
    r"n=(?P<n>-?\d+)\s+i=(?P<i>-?\d+)"
)

def run_and_capture(list_len, n):
    proc = subprocess.run(
        ["./bug", str(list_len), str(n)],
        capture_output=True, text=True
    )
    output = proc.stdout + proc.stderr
    last_state = None
    for line in output.splitlines():
        m = STATE_RE.search(line)
        if m:
            last_state = m.groupdict()
    if last_state is None:
        print("No STATE captured for input", list_len, n, file=sys.stderr)
        return None
    last_state["p_is_null"] = 1 if last_state["p"] == "(nil)" else 0
    last_state["n"] = int(last_state["n"])
    last_state["i"] = int(last_state["i"])
    return last_state

def append_log(state, list_len, n):
    log_path = Path("crash_states.csv")
    with log_path.open("a") as f:
        f.write(f"{list_len},{n},{state['p_is_null']},{state['n']},{state['i']}\n")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("usage: collect_state.py <list_len> <n>")
        sys.exit(1)
    list_len = int(sys.argv[1])
    n = int(sys.argv[2])

    s = run_and_capture(list_len, n)
    if s is not None:
        append_log(s, list_len, n)
        print("Captured:", s)
