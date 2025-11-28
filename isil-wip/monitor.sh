#!/usr/bin/env bash
set -euo pipefail

# Always run from this script's directory
cd "$(dirname "$0")"

FUZZ_DIR="/work/out"
CRASH_DIR="$FUZZ_DIR/default/crashes"
TARGET_PROG="./target"    # non-instrumented original
MAGIC=67                  # must match quit 67 in GDB script

mkdir -p "$CRASH_DIR"

echo "[*] Watching $CRASH_DIR for new crashes..."

while read crash_file; do
    echo
    echo "[*] New crash detected: $crash_file"
    echo "[*] Running original program under GDB with this input..."

    set +e
    gdb -q -batch -x check_magic_line.gdb --args "$TARGET_PROG" "$crash_file"
    ret=$?
    set -e

    echo "[*] GDB exit code: $ret"

    if [ "$ret" -eq "$MAGIC" ]; then
        echo "[*] Magic line reached (exit $MAGIC). Stopping afl-fuzz..."
        pkill afl-fuzz || true
        break
    fi
done < <(inotifywait -m -e create -e moved_to --format '%w%f' "$CRASH_DIR")

echo "[*] monitor.sh done."
