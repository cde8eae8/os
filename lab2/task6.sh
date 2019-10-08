#!/bin/bash

find /var/log -name '*.log' -type f -readable 2>/dev/null -print0 | xargs -0 cat | wc -l
