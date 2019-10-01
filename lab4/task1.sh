#!/bin/bash

function clean() {
	rm -rf test_task1
	rm -f report
}
clean

date=$(date)
mkdir test_task1 2>/dev/null && { echo "catalog test_task1 was created successfully" > report; touch "test_task1/$date"; }
ping -c 5 www.net_nikogo.ru 2>/dev/null || echo "Can't connect to www.net_nikogo.net" >> report
