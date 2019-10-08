#!/bin/bash

# grep -h --binary-files=without-match -R 'ACPI' "$(find /var/log/ -readable)" 2>/dev/null 1>errors.log
find /var/log/ -readable -print0 | xargs -0 grep -h --binary-files=without-match -R 'ACPI'  2>/dev/null 1>errors.log

echo "Output file:"
cat errors.log

echo
echo with files:
echo
grep -E '(/.*)+' errors.log

