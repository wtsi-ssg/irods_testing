#!/usr/bin/env bats

#Create, modify and remove resource groups
## Assumes that the two ires tests have been run first
## leaves a resource group structure in place for further testing

@test "create test-green resource group from irods-ires1-testres1 " {
	run iadmin atrg test-green irods-ires1-testres1
	echo $output
	[ $status = 0 ]
}

@test "Confirm test-green resource group" {
	run iadmin lrg
	echo ${lines[0]}
	 [[ ${lines[0]} =~ "test-green" ]]
}

@test "Confirm test-green resource group has irods-ires1-testres1" {
	run iadmin lrg test-green
	echo ${lines}
	 [[ ${lines[@]} =~ "irods-ires1-testres1" ]]
}

@test "add irods-ires1-testres2 to test-green resource group " {
	run iadmin atrg test-green irods-ires1-testres2
	echo $output
	[ $status = 0 ]
}

@test "create test-red resource group from irods-ires2-testres1 " {
	run iadmin atrg test-red irods-ires2-testres1
	echo $output
	[ $status = 0 ]
}

@test "Confirm test-red resource group" {
	run iadmin lrg
	echo ${lines[1]}
	 [[ ${lines[1]} =~ "test-red" ]]
}

@test "Confirm test-red resource group has irods-ires2-testres1" {
	run iadmin lrg test-red
	echo ${lines}
	 [[ ${lines[@]} =~ "irods-ires2-testres1" ]]
}

@test "add irods-ires2-testres2 to test-red resource group " {
	run iadmin atrg test-red irods-ires2-testres2
	echo $output
	[ $status = 0 ]
}

@test "create test-ablative resource group from irods-ires2-testres1 " {
	run iadmin atrg test-ablative irods-ires2-testres1
	echo $output
	[ $status = 0 ]
}

@test "Confirm test-ablative resource group" {
	run iadmin lrg
	echo ${lines[2]}
	 [[ ${lines[@]} =~ "test-ablative" ]]
}

@test "Confirm test-ablative resource group has irods-ires2-testres1" {
	run iadmin lrg test-ablative
	echo ${lines}
	 [[ ${lines[@]} =~ "irods-ires2-testres1" ]]
}

@test "Remove test-ablative resource group" {
	run iadmin rfrg test-ablative irods-ires2-testres1
	echo $output
	[ $status = 0 ]
}

@test "Confirm test-ablative resource group no longer exists" {
	run iadmin lrg 
	 ! [[ ${lines[@]} =~ "test-ablative" ]]
}







