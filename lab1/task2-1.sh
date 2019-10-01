#!/bin/bash

if [[ $# != 3 ]]; then
	echo "Usage: $0 number1 number2 number3";
	exit
fi

if [[  $1 >  $2  && $1 > $3 ]]; then
	echo $1
elif [[ $2 >  $1 &&  $2 > $3 ]]; then
	echo $2
else
	echo $3
fi

