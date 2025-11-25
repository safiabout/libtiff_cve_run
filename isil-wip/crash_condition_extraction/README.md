clang -g -O0 bug.c -o bug
for test1.c as bug.c
printf '\x01\x00\x00\x00\x04\x00\x00\x00' | ./bug #optional
printf '\x01\x00\x00\x00\x04\x00\x00\x00' > input.bin #optional
gdb -q -batch -x break.gdb --args ./bug < input.bin #optional
python3 collect_state.py 1 4
python3 synth_assert.py
recompile with the new header and replay the crash