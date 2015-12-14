#!/usr/bin/env bats

#testing simple group membership and removal

@test "Add  testaccount1" {
	run iadmin mkuser testaccount1 rodsuser
    echo $output	
	[ $status = "0" ]
}

@test "Add  testaccount2" {
	run iadmin mkuser testaccount2 rodsuser
    echo $output	
	[ $status = "0" ]
}

@test "Add  testaccount3" {
	run iadmin mkuser testaccount3 rodsuser
    echo $output	
	[ $status = "0" ]
}

@test "Add  testaccount4" {
	run iadmin mkuser testaccount4 rodsuser
    echo $output	
	[ $status = "0" ]
}

@test "Add  testaccount5" {
	run iadmin mkuser testaccount5 rodsuser
    echo $output	
	[ $status = "0" ]
}

@test "Add  testaccount6" {
	run iadmin mkuser testaccount56 rodsuser
    echo $output	
	[ $status = "0" ]
}

@test "Add  testaccount7" {
	run iadmin mkuser testaccount7 rodsuser
    echo $output	
	[ $status = "0" ]
}

@test "Add  testaccount8" {
	run iadmin mkuser testaccount8 rodsuser
    echo $output	
	[ $status = "0" ]
}

@test "Add  testaccount9" {
	run iadmin mkuser testaccount9 rodsuser
    echo $output	
	[ $status = "0" ]
}

@test "Add  testaccount10" {
	run iadmin mkuser testaccount10 rodsuser
    echo $output	
	[ $status = "0" ]
}

@test "Add testgroup1" {
	run iadmin mkgroup testgroup1
    echo $output	
	[ $status = "0" ]
}

test "Add testuser1 to testgroup1" {
	run iadmin atg testgroup1 testaccount1 
    echo $output	
	[ $status = "0" ]
}

test "Add testuser2 to testgroup1" {
	run iadmin atg testgroup1 testaccount2 
    echo $output	
	[ $status = "0" ]
}

test "Add testuser3 to testgroup1" {
	run iadmin atg testgroup1 testaccount3 
    echo $output	
	[ $status = "0" ]
}

test "Add testuser4 to testgroup1" {
	run iadmin atg testgroup1 testaccount4 
    echo $output	
	[ $status = "0" ]
}

test "Add testuser5 to testgroup1" {
	run iadmin atg testgroup1 testaccount5 
    echo $output	
	[ $status = "0" ]
}

test "Add testuser6 to testgroup1" {
	run iadmin atg testgroup1 testaccount6 
    echo $output	
	[ $status = "0" ]
}

test "Add testuser7 to testgroup1" {
	run iadmin atg testgroup1 testaccount7 
    echo $output	
	[ $status = "0" ]
}

test "Add testuser8 to testgroup1" {
	run iadmin atg testgroup1 testaccount8 
    echo $output	
	[ $status = "0" ]
}

test "Add testuser9 to testgroup1" {
	run iadmin atg testgroup1 testaccount9 
    echo $output	
	[ $status = "0" ]
}

test "Add testuser10 to testgroup1" {
	run iadmin atg testgroup1 testaccount10 
    echo $output	
	[ $status = "0" ]
}

@test "Check that ten users are in testgroup1" {
        run iadmin lg testgroup1 | wc -l
         [[ ${lines[0]} =~ "10" ]]
}

