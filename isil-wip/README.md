



Build the docker:

```bash
docker build -t afl-test .
```

Run it:

```bash
docker run -it --privileged afl-test
```

**AFL requires `--privileged` on macOS Docker**
because AFL uses `ptrace` and shared memory.

---

# Create AFL crashing input

Inside the container:

```bash
echo "AAAA" > crash_input
```

This should crash the target.

Test manually:

```bash
./target crash_input
```

You should see:

```
Target running...
Crashing now...
Segmentation fault
```

---

# Test GDB breakpoint detection

Create the GDB script if doesnt exist:

`check_magic_line.gdb`:

```gdb
set pagination off
set confirm off
break target.c:20
commands
  printf "HIT LINE 20\n"
  quit 67
end
run
quit 0
```

Run GDB:

```bash
gdb -q -batch -x check_magic_line.gdb --args ./target crash_input
echo $?
```

You should see:

```
HIT LINE 5
67
```

Perfect: this means **line 20 was reached**.

---
Personal Notes:

```set pagination off``` So this disables paging so GDB never waits for user input.
```set confirm off``` disables Quit anyway? (y or n) kind of questions
```commands``` This opens a block that defines what GDB should do when this breakpoint is hit.

```run``` This actually starts the program inside GDB.
When you invoke GDB like:
```gdb -q -batch -x check_magic_line.gdb --args ./target crash_input```
```--args ./target crash_input``` sets the program and its arguments.
```run``` inside the script then runs ./target crash_input.

Flags:
-q → quiet (no banner)
-batch → non-interactive:
execute all commands
then exit
if any command errors, exit with non-zero status
-x file → read commands from that file
--args → everything after this is your program + args
Inside the script, you can use anything you’d type manually in GDB: break, run, bt, info locals, set, quit, etc.

RUN AFL FIRST AND THEN MONITOR