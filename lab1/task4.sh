#!/bin/bash

counter=0
last=1

while [[ $((last % 2)) -ne 0 ]]; do
	read -r last
	if [[ ! "$last" =~ ^-?[0-9]+$ ]]; then
		echo "error: not a number"
		exit 1
	fi
	((counter++))
done
echo $counter
