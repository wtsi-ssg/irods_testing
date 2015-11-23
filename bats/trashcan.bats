#!/usr/bin/env bats

# check replication works
# MUST have run the rules_setup first

setup(){
	INSERT_FILE=irods_automated_deletion_test.txt
	touch $INSERT_FILE
}

@test "Check that iput stores a txt document correctly" {	

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

@test "remove a collection" {

	run irm $INSERT_FILE
	[ $status = "0" ]
}

@test "fail to remove file from Trash" {
	run irmtrash $INSERT_FILE
	[[ ${lines[0]} =~ "ERROR: rmtrashUtil:" ]]
}