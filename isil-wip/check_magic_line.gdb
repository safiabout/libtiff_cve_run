set pagination off
set confirm off
break target.c:5
commands
  printf "HIT LINE 5\n"
  quit 67
end
run
quit 0
