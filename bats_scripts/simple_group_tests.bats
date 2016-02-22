#!/usr/bin/env bats

#testing simple group membership and removal

@test "Add scrachgroup" {
	run iadmin mkgroup scratchgroup
    echo $output	
	[ $status = "0" ]
}
#tests try account addition and removal
@test "Add an account" {
        run iadmin mkuser scratchaccount1 rodsuser
    echo $output
        [ $status = "0" ]
}

@test "Add testuser1 to scratchgroup" {
	run iadmin atg scratchgroup scratchaccount1 	
	[ $status = "0" ]
}


@test "remove testuser1 from scratchgroup" {
	run iadmin rfg scratchgroup scratchaccount1 
	[ $status = "0" ]
}

@test "remove an account" {
        run iadmin rmuser scratchaccount1
    echo $output
        [ $status = "0" ]
}

@test "remove scratchgroup1" {
	run iadmin rmgroup scratchgroup
    echo $output	
	[ $status = "0" ]
}





