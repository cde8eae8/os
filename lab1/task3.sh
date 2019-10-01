#!/bin/bash

all=""

while [[ $last != "q" ]]; do
	all="${all}${last}"
	read -r last
done
echo "$all"
