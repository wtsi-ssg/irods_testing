#!/usr/bin/env bats


@test "Check that iadmin can create a throwaway resource group" {
	run iadmin atrg test-demo demoResc
	[ $status = 0 ]
}

@test "Check that iadmin can remove a resource from a throwaway resource group" {
	run iadmin rfrg test-demo demoResc
	[ $status = 0 ]
}
