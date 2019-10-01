#!/bin/bash

# n1 n2 n3 exp
test() {
	check $1 $2 $3 $4
	check $1 $3 $2 $4
	check $2 $1 $3 $4
	check $2 $3 $1 $4
	check $3 $2 $1 $4
	check $3 $1 $2 $4
}

check() {
	res=$(./task2.sh "$1" "$2" "$3")
	if [[ "$res" = "$4" ]]; then
		echo "passed"
	else
		echo "not passed $1 $2 $3, res=$res, expected $4"
	fi
}

test 1 2 3 3
test -1 0 1 1
test -1 -2 -3 -1
test 0 0 0 0
test 1 1 1 1
test -1 -1 -1 -1
test 1 2 2 2
test 2 2 3 3
test 1000000 10000 100 1000000
test -1000000 -10000 -100 -100
