#!/bin/bash

grep --text -o -h -R -P '([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})' /etc/* 2>/dev/null |
 				sort | uniq |
				sed 's/$/, /g' |  tr --delete '\n' | head -c-2 > emails.lst

echo "Output file:"
cat emails.lst

