# file: break.gdb
set pagination off
set confirm off

file ./bug

# Make sure this line matches the CAPTURE_STATE line in bug.c
# Use your editor or 'nl -ba bug.c | sed -n "20,40p"' to check.
break bug.c:25

define dump_state
python
import gdb, json

def parse_vars(text):
    vars = {}
    for line in text.splitlines():
        line = line.strip()
        if not line or '=' not in line:
            continue
        name, val = line.split('=', 1)
        name = name.strip()
        val = val.strip()
        # Avoid duplicate entries; locals override args if same name
        vars[name] = val
    return vars

args_out   = gdb.execute("info args",   to_string=True)
locals_out = gdb.execute("info locals", to_string=True)

vars = {}
vars.update(parse_vars(args_out))
vars.update(parse_vars(locals_out))

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
