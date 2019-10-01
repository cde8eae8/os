#!/bin/bash

grep -h --binary-files=without-match -R 'ACPI' $(find /var/log/ -readable ) 2>/dev/null 1>errors.log

echo "Output file:"
cat errors.log

