#!/bin/bash

cut -d: -f1,3 /etc/passwd | sort -n -k2 -t:

