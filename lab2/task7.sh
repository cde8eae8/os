#!/bin/bash

man bash | grep -oE '\<[A-Za-z-]{4,}\>' | sort | uniq -ic | sort -n -k1 -t" " | tail -3 | awk '{ print $2 }'

