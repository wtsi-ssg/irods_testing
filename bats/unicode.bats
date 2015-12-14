#!/usr/bin/env bats

#unicode tests
# check we can put, get a file with unicode in name and content

setup(){
	INSERT_FILE=irods_unicode_ɸ_test.txt
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
}

@test "Check that iget can retrieve the txt document correctly" {
	
	run iget -K -f $INSERT_FILE 
	[ "$status" -eq 0 ]
	[ -e ${INSERT_FILE} ]
}

@test "Add Unicode Metadata" {
	run imeta add -d $INSERT_FILE unicode_test test_ɸ_value testunit
	[ "$status" -eq 0 ]
}

@test "List Unicode Metadata" {
	run imeta ls -d $INSERT_FILE
	[[ ${lines[1]} =~ "attribute: unicode_test" ]]
}