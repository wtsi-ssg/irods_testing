#!/usr/bin/env bats

#post 3-4 upgrade tests

@test "Check that ten users are in testgroup1" {
        run iadmin lg testgroup1 | wc -l
         [[ ${lines[0]} =~ "11" ]]
}

@test "verify that testaccount1 retains permissions to $INSERT_FILE" {	

	run ils -A $INSERT_FILE | grep ACL | grep testaccount1
	[ $status = "0" ]
}