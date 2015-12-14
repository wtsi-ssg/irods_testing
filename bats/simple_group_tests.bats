#!/usr/bin/env bats

#testing simple group membership and removal

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





