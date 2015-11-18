#!/usr/bin/env bats

#tests try account addition and removal
@test "Add an account" {
	run iadmin mkuser testuseraccount rodsuser
    echo $output	
	[ $status = "0" ]
}

@test "remove an account" {
	run iadmin rmuser testuseraccount
    echo $output	
	[ $status = "0" ]
}