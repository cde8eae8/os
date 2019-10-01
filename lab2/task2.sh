#!/bin/bash

grep -E '(\[[ .0-9]+\]) \((WW)|(II)\)' /var/log/Xorg.1.log | 
	sed -E 's/(\[[ .0-9]+\]) \(WW\) /Warning:     \1 /g' | 
	sed -E 's/(\[[ .0-9]+\]) \(II\) /Information: \1 /g' > full.log


echo "Output file:"
cat full.log
