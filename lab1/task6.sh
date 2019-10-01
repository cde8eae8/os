#!/bin/bash


if [[ "$(pwd)" == "$HOME" ]]; then
	exit 0
else
	echo "error"
	exit 1
fi

