#!/usr/bin/env bats


@test "Check that iadmin can create a resource group" {
	run iadmin atrg test-green irods-ires1-testres1
	[ $status = 0 ]
}

@test "Check that iadmin can append to a resource group" {
	run iadmin atrg test-green irods-ires1-testres2
	[ $status = 0 ]
}

@test "Check that iadmin can create a second resource group" {
	run iadmin atrg test-red irods-ires2-testres1
	[ $status = 0 ]
}

@test "Check that iadmin can append to a second resource group" {
	run iadmin atrg test-red irods-ires2-testres2
	[ $status = 0 ]
}

@test "Check that iadmin can create a throwaway resource group" {
	run iadmin atrg test-demo demoResc
	[ $status = 0 ]
}

@test "Check that iadmin can remove a resource from a throwaway resource group" {
	run iadmin rfrg test-demo demoResc
	[ $status = 0 ]
}
