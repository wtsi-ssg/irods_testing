#!/usr/bin/env bats



#tests use iput, iget, ils, ipwd
@test "Check the output of ils" {
	run ils
	echo ${lines[0]}
	 [[ ${lines[0]} =~ "/tempZone/home/irods:" ]]
}

@test "Check the output of ipwd" {
	run ipwd
	echo $output
	[ $output = "/tempZone/home/irods" ]
}

@test "make a collection" {
	run imkdir TestCol
        echo $output	
	[ $status = "0" ]
}

@test "remove a collection" {

	run irm -r TestCol
	echo $output
	[ $status = "0" ]
}

setup(){
	INSERT_FILE=test.txt
	touch $INSERT_FILE
}
@test "Check that iput stores a txt document correctly" {	

 	iput -K $INSERT_FILE
	run ils
	for i in $lines[@]; do
		if [ i = $INSERT_FILE ]; then
			[ true ]
		fi
	done
	[ false ]
}
teardown(){
	rm $INSERT_FILE
}

@test "Check that iget can retrieve the txt document correctly" {
	
	echo $INSERT_FILE
	run iget -K $INSERT_FILE ${INSERT_FILE}_gotten
	echo $status 
	echo $output
	[ $status = 0 ]
	[ -e ${INSERT_FILE}_gotten ]
}

@test "remove temporary file using irm" {
	run irm $INSERT_FILE
	[ $status = 0 ]
}
