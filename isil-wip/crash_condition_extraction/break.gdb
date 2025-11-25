# file: break.gdb
set pagination off
set confirm off

file ./bug

# Break at the site where you want the precondition (in main)
# Adjust the line number as needed.
break bug.c:41

# When breakpoint hits, print args + locals with markers, then continue.
commands 1
silent
printf "STATE_START\n"
info args
info locals
printf "STATE_END\n"
continue
end

run
quit
