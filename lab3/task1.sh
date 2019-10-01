#!/bin/bash

files=$(ps -u root -o pid,cmd | tail -n+2)
echo "n_lines: $(echo "$files" | wc -l)"
echo "$files" | awk '{ s = ""; for (i = 2; i <= NF; ++i) { s = s $i " "} print $1 ":" s; }' > task1.out

echo "*** Output file ***"
cat task1.out

