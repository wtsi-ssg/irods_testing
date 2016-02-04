#!/usr/bin/env bats

#post 3-4 upgrade tests

setup(){
	INSERT_FILE=irods_unicode_ɸ_test.txt
	test_value_hex=""
}

@test "Check that ten users are in testgroup1" {
        count=$(iadmin lg testgroup1 | wc -l)
        [ "$count" = "11" ]
}

@test "verify that testaccount1 retains permissions to irods_permission_test.txt" {	

	run ils -A irods_permission_test.txt 
	for i in $lines[@]; do
		if [ i = "        ACL - rods#tempZone:own   testaccount1#tempZone:own" ]; then
			[ true ]
		fi
	done
	[ false ]
	
}

@test "List Unicode Metadata" {
	run imeta ls -d $INSERT_FILE
	[[ ${lines[1]} =~ "attribute: unicode_test" ]]
}

@test "confirm hexdump of returned metadata is same as put in" {
    $test_value_hex << EOM
0000000 6574 7473 c95f 5fb8 6176 756c 0a65
000000e
EOM

    imeta ls -d irods_unicode_ɸ_test3.txt unicode_test | grep value: | cut -d" " -f2 | hexdump
    [[ $test_value_hex = $output ]]

}