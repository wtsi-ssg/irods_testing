#!/usr/bin/env bats

#permission tests
# needs to have been run AFTER multiple_users_groups.bats

setup(){
	INSERT_FILE=irods_permission_test.txt
	dd if=/dev/zero of=$INSERT_FILE bs=1M count=1
}

@test "iput a file" {	

 	iput -K -f $INSERT_FILE
	run ils
	for i in $lines[@]; do
		if [ i = $INSERT_FILE ]; then
			[ true ]
		fi
	done
	[ false ]
	echo $output
}