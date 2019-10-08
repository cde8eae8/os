#!/bin/bash

man bash | grep -oE '\<[A-Za-z-]{4,}\>' | 
		sort | uniq -ic | sort -r -n -k1 -t" " | head -3 | awk '{ print $2 }'

