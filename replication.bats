#!/usr/bin/env bats

# check replication works
# MUST have run the rules_setup first

setup(){
	INSERT_FILE=irods_automated_replication_test.txt
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