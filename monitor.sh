#!/usr/bin/env bash
set -euo pipefail

# execute from script's directory($0)
cd "$(dirname "$0")"

FUZZ_DIR="/root/fuzz_runs"
CRASH_DIR="/root/fuzz_runs/libtiff_out/default/crashes"
HARNESS="./harness/harness"              
TARGET_PROG="./target"  

# Stop fuzzing when target return this code
MAGIC=67 # range 64-125 is for user-defined exit codes

mkdir -p "$CRASH_DIR"

# & => start afl-fuzz in background
# /AFLplusplus/afl-fuzz -i "/root/fuzz_runs/libtiff_in" -o "/root/fuzz_runs/libtiff_out" -m none -d -- "./harness/harness" @@ &

echo "[*] Watching $CRASH_DIR for new crashes..."

#sudo apt-get install inotify-tools
#-m => monitor mode
#-e create => watch for file creation events
#--format '%w%f' => output the full path of the created file (directory + filename)
while read crash_file;do
    echo
    echo "[*] New crash detected: $crash_file"
    echo "[*] Running original program with this input..."
    set +e # disable exit on error to capture target's exit code
    "$TARGET_PROG" "$crash_file"
    ret=$? 
    set -e # re-enable exit on error
    # $? => exit code of the last command
    echo "[*] Original program exit code: $ret"

    # If return MAGIC, stop afl-fuzz
    if [ "$ret" -eq "$MAGIC" ]; then
        echo "[*] Magic return code ($MAGIC) detected. Stopping afl-fuzz..."
        pkill afl-fuzz
        # kill "$AFL_PID" 2>/dev/null || true # true to avoid error if process already ended
        break
    fi
done < <(inotifywait -m -e create -e moved_to --format '%w%f' "$CRASH_DIR")
# if use pipeline(|), the while loop runs in a subshell, so variables set inside it are lost when it ends

# wait for afl-fuzz to terminate
# wait "$AFL_PID" 2>/dev/null || true
echo "[*] Done."
