#!/bin/bash

ps ax -o pid,cmd | awk '{ if ($2 ~ "^/usr/sbin/.*") { print $1 } }'
