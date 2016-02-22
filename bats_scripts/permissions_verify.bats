#!/usr/bin/env bats

#verify permissions set before upgrade remain 



@test "verify that testaccount1 retains permissions to irods_permission_test.txt" {	

	run ils -A irods_permission_test.txt 
	for i in $lines[@]; do
		if [ i = "        ACL - rods#tempZone:own   testaccount1#tempZone:own" ]; then
			[ true ]
		fi
	done
	[ false ]
	
}