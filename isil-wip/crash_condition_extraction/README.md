

## Build Docker Image

```bash
docker build --no-cache -t crash-demo .
```

## Run Container (mount current directory)

```bash
docker run --rm -it -v "$(pwd)":/app -w /app crash-demo
```

## Inside Container: Initial Build

```bash
clang -g -O0 bug.c -o bug
```

## Optional: Direct Run of Crashing Input (1,4)

```bash
printf '\x01\x00\x00\x00\x04\x00\x00\x00' | ./bug
printf '\x01\x00\x00\x00\x04\x00\x00\x00' > input.bin
gdb -q -batch -x break.gdb --args ./bug < input.bin
```

---

# Learn Crash Condition for (1,4)

```bash
python3 collect_state.py 1 4
python3 synth_assert.py
clang -g -O0 bug.c -o bug
printf '\x01\x00\x00\x00\x04\x00\x00\x00' | ./bug
```

# Learn Crash Condition for (1,5)

```bash
python3 collect_state.py 1 5
python3 synth_assert.py
clang -g -O0 bug.c -o bug
printf '\x01\x00\x00\x00\x05\x00\x00\x00' | ./bug
```

# Learn Crash Condition for (1,6)

```bash
python3 collect_state.py 1 6
python3 synth_assert.py
clang -g -O0 bug.c -o bug
printf '\x01\x00\x00\x00\x06\x00\x00\x00' | ./bug
```

---

If you want, I can also generate a one-shot automation script or add a summary section showing the expected changes to `CRASH_COND` after each learning step.
