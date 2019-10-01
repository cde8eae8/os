#!/bin/bash

TRASH_PATH="$HOME/tmp/os-praxis/lab5/.trash"
TRASH_STATE="$TRASH_PATH/.state"
TRASH_LOG="$TRASH_PATH/.trash.log"

if [[ $# -ne 1 ]]; then
	echo "Usage: $0 file"
	exit -1
fi

file=$1
ls -lah ~/tmp/os-praxis/lab5/
echo ";;;;;;;;;;;;"

if [[ ! -f $file ]]; then
	echo "$file isn't file"
	exit -2
fi


if [[ ! -d "$TRASH_PATH" ]]; then
	if mkdir -p "$TRASH_PATH"; then
		echo "directory $TRASH_PATH created"
	else
		>&2 echo "FATAL ERROR: can't create directory $TRASH_PATH"
	fi
fi

if [[ ! -f "$TRASH_STATE" ]]; then
	if touch "$TRASH_STATE"; then
		echo "file $TRASH_STATE created"
	else
		>&2 echo "FATAL ERROR: can't create file $TRASH_STATE"
	fi
fi

uniq_number=$(awk -F':' "/$file/ { print \$2; }" $TRASH_STATE)
echo "un=$uniq_number"
[[ $uniq_number -eq 0 ]]; is_new_file=$?
echo $is_new_file
	
uniq_number=$(( uniq_number + 1 ))

link_name="$TRASH_PATH/$file.$uniq_number.trash"
ln "$file" "$link_name"
echo "created hard link to $file named $link_name"

if [[ $is_new_file -eq 0 ]]; then
	echo "new file"
	echo "$file:$uniq_number" >> $TRASH_STATE
else
	sed -i -e "s/$file:[[:digit:]]*/$file:$uniq_number/g" $TRASH_STATE
fi
echo "$(pwd)/$file:$link_name" >> $TRASH_LOG

echo "STATE"
cat $TRASH_STATE
echo
echo "LOG"
cat $TRASH_LOG
