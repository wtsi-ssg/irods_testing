#!/usr/bin/env bats

#testing simle group membership and removal
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
	run iadmin mkuser testaccount6 rodsuser
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


@test "Add scrachgroup" {
	run iadmin mkgroup scratchgroup
    echo $output	
	[ $status = "0" ]
}

test "Add testuser1 to scratchgroup" {
	run iadmin atg scratchgroup testaccount1 
    echo $output	
	[ $status = "0" ]
}


test "remove testuser1 from scratchgroup" {
	run iadmin rfg scratchgroup testaccount1 
    echo $output	
	[ $status = "0" ]
}

test "remove scratchgroup1" {
	run iadmin rmgroup scratchgroup
    echo $output	
	[ $status = "0" ]
}

