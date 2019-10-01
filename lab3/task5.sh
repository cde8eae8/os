#!/bin/bash

cat $(ps ax -o pid | awk '{ print "/proc/" $1 "/status /proc/" $1 "/sched"}') 2>/dev/null | 
	tr --delete ':' | 
	grep -E '^Pid|^PPid|nr_switches|sum_exec_runtime' | 
	awk '{ pid = $2; 
				getline; 
				ppid = $2; 
				getline; 
				sum_exec = $2; 
				getline; 
				n_switches = $2; 
				print pid ":"  ppid ":" sum_exec / n_switches; }' | 
	sort -t: -k2 -n
