# Monitor.sh usage

1. install inotify-tools
```
apt-get install inotify-tools
```
2. Get a target program and compile it 
```
clang target.c -o target
```
3. Set Variable in monitor.sh
```
// the commands will run under `libtiff_cve_run`
FUZZ_DIR="the/path/of/fuzz_runs"
CRASH_DIR="the/path/of/crashes"
HARNESS="./harness/harness"              
TARGET_PROG="/path/to/target/program" // the program u wanna take crash as input
MAGIC="67" // the exit(MAGIC) in the program
export AFL_CRASH_EXITCODE='101' 
```

3. Open another terminal
4. Run the afl++ in another terminal
5. Run the monitor.sh in current terminal
