# file: break.gdb
set pagination off
set confirm off

file ./bug

# Adjust this line to wherever you want to break:
break bug.c:25

define dump_state
python
import gdb, json

frame = gdb.selected_frame()
block = frame.block()

vars = {}

b = block
while b is not None:
    # If you *only* want locals/args, you can stop at global block:
    # if b.is_global:
    #     break

    for sym in b:
        # Some items in the block iterator may not be real Symbols
        try:
            if not isinstance(sym, gdb.Symbol):
                continue
        except Exception:
            continue

        if not sym.is_variable:
            continue

        name = sym.name
        if not name:
            continue

        if name in vars:
            continue

        try:
            val = sym.value(frame)
            vars[name] = str(val)
        except Exception:
            vars[name] = "<unavailable>"

    b = b.superblock

print("STATE_JSON " + json.dumps(vars))
end
end

# When breakpoint 1 hits, dump state and continue.
commands 1
silent
dump_state
continue
end

# Actually run the program with the args passed via --args
run
quit
