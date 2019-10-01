#!/bin/bash

test() {
	res=$(./task1.sh "$1" "$2")
	if [[ "$res" == "$3" ]]; then
		#echo "passed"
	else
		echo "not passed test $1 $2"
	fi
}

test "123" "123" "equal"
test "1 23" "1 23" "equal"
test "  123  " "  123  " "equal"
test "123  " "  123  " "unequal"
test "  123  " "  123" "unequal"
test "  12sdfjl3  " "  123  " "unequal"
test "  123  " "  12asdf3  " "unequal"

test "  " "  " "equal"
test "   " "  " "unequal"

test "" "  " "unequal"
test "" "" "equal"
