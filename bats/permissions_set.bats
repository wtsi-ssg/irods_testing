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

@test "add owner permission to $INSERT_FILE for testaccount1" {

	run ichmod -M own testaccount1 $INSERT_FILE
	echo $output
	[ $status = "0" ]
}

@test "verify that testaccount1 retains permissions to $INSERT_FILE" {	

	run ils -A $INSERT_FILE | grep ACL | grep testaccount1
	[ $status = "0" ]
}