SCRIPT="/home/nikita/tmp/os-praxis/lab1/task6.sh"

# folder
test() {
	echo "Test for $1"
	cd $1
	eval $SCRIPT
	echo $?
	cd - > /dev/null
}

test ~/
test /tmp
test ~/tmp

