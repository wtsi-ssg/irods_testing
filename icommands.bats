#!/usr/bin/env bats

setup(){
	INSERT_FILE=irods_automated_test.txt
	touch $INSERT_FILE
}

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


@test "Check that iget can retrieve the txt document correctly" {
	
	echo $INSERT_FILE
	run iget -K -f $INSERT_FILE 
	echo $status 
	echo $output
	[ $status = 0 ]
	[ -e ${INSERT_FILE} ]
}


@test "Add Metadata" {
	run imeta add -d $INSERT_FILE testname testvalue testunit
	echo $output
	[ $status = 0 ]
}

@test "List Metadata" {
	run imeta ls -d $INSERT_FILE
	echo $output
	[[ ${lines[1]} =~ "attribute: testname" ]]
}

@test "remove temporary file using irm" {
	run irm $INSERT_FILE
	echo $output
	[ $status = 0 ]
}

#could use the teardown() function here but it seems to run after every test
@test "clean up" {
	rm $INSERT_FILE
	run irm $INSERT_FILE
}
