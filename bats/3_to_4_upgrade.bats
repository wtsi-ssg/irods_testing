#!/usr/bin/env bats

#post 3-4 upgrade tests

@test "Check that ten users are in testgroup1" {
        run iadmin lg testgroup1 | wc -l
         [[ ${lines[0]} =~ "11" ]]
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