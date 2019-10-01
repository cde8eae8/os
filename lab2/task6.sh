#!/bin/bash

cat $(find /var/log -name '*.log' -type f -readable 2>/dev/null) | wc -l
