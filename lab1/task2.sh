#!/bin/bash

if [[ $# != 3 ]]; then
	echo "Usage: $0 number1 number2 number3";
	exit
fi

res=$1
if [[ $res -lt $2 ]]; then
	res=$2
fi

if [[ $res -lt $3 ]]; then
	res=$3
fi

echo "$res"
