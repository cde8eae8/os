#!/bin/bash


#tmp=$(head -1 -q $(find /bin -type f) | grep --text -P '^#!' | 
#	sed -e 's/[[:space:]]*#![[:space:]]*\(.*\)/\1/g' |  	# "  #!  /bin/sh  " -> "/bin/sh"
#	sort | uniq -c | sort -n -k1 -t" " | tail -1)

find /bin/* -type f -print0 | xargs -0 gawk '
{ 
	if ($0 ~ /^ *#[^!].*$/) {
		next; 
	}
	if ($0 ~ /^#!.*$/) {
		print $0 
	}
	nextfile;
}' | 
	sed -e 's/[[:space:]]*#![[:space:]]*\(.*\)/\1/g' |  	# "  #!  /bin/sh  " -> "/bin/sh"
	sort | uniq -c | sort -n -k1 -t" " | tail -1




