#!/bin/bash

ps ax -o pid | tail -n +2 | awk '
BEGIN { OFS=":"; }
{ 
	pid = $1; 
	stat_file = "/proc/" pid "/statm"; 
	if ((getline < stat_file) != 1) {
		next; 
	}
	print pid, $2 - $3; 
}' | sort -t: -k2 -n -r


