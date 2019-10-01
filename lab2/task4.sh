#!/bin/bash


tmp=$(head -1 -q $(find /bin -type f) | grep --text -P '^#!' | 
	sed -e 's/[[:space:]]*#![[:space:]]*\(.*\)/\1/g' |  	# "  #!  /bin/sh  " -> "/bin/sh"
	sort | uniq -c | sort -n -k1 -t" " | tail -1

echo "${tmp// *[0-9]* /}"




