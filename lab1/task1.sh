#!/bin/bash

if [[ $# != 2 ]]; then
	echo "Usage: $0 string1 string2";
	exit
fi

if [[ "$1" == "$2" ]]; then
	echo "equal"
else
	echo "unequal"
fi
