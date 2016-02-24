#!/usr/bin/env bats

# post upgrade access of replicated files

setup(){
	INSERT_FILE=irods_automated_replication_test.txt
}

@test "Check that iget can retrieve the document correctly from first replica " {
	
	echo $INSERT_FILE
	run iget -K -f -n 0 $INSERT_FILE 
	echo $status 
	echo $output
	[ $status = 0 ]
	[ -e ${INSERT_FILE} ]
}

@test "Check that iget can retrieve the document correctly from second replica " {
	
	echo $INSERT_FILE
	run iget -K -f -n 1 $INSERT_FILE 
	echo $status 
	echo $output
	[ $status = 0 ]
	[ -e ${INSERT_FILE} ]
}
