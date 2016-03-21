#!/usr/bin/env bats

setup(){
	INSERT_FILE=irods_automated_test.txt
	dd if=/dev/urandom of=$INSERT_FILE bs=10 count=100
}

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

@test "Check iput " {
	FILE=${INSERT_FILE}_$RANDOM	
	dd if=/dev/urandom of=${FILE} bs=10 count=100
 	echo ${FILE}
        run iput -K -f ${FILE}
	rm $FILE 
	echo $output
        [ $status = "0" ]
}

@test "Check irm" {	

 	iput -K -f ${INSERT_FILE}
	run irm ${INSERT_FILE}
        echo $output
        [ $status = "0" ]
}

@test "Check iget" {
	
	iput -K -f $INSERT_FILE
	run iget -K -f $INSERT_FILE 
        irm $INSERT_FILE
	echo $status 
	echo $output
	[ $status = 0 ]
}

@test "make a collection" {
	run imkdir TestCol
        irm -r TestCol
	echo $output
        [ $status = "0" ]
}

@test "remove a collection" {
        imkdir TestCol
	run irm -r TestCol
	echo $output
	[ $status = "0" ]
}

@test "Add Metadata" {
	iput -K -f $INSERT_FILE
	run imeta add -d $INSERT_FILE testname testvalue testunit
	irm $INSERT_FILE
        echo $output
	[ $status = 0 ]
}

@test "List Metadata" {
	iput -K -f $INSERT_FILE
        imeta add -d $INSERT_FILE testname testvalue testunit
	run imeta ls -d $INSERT_FILE
        irm $INSERT_FILE
	echo $output
	[[ ${lines[1]} =~ "attribute: testname" ]]
}
#could use the teardown() function here but it seems to run after every test
@test "clean up" {
	rm $INSERT_FILE
}
