#!/usr/bin/env bats


##Start of Resource Tests
@test "Create directory for irods-ires2-testres1" {
	run sudo mkdir -p /irods-ires2-testres1
	echo $output
	[ $status = 0 ]
}

@test "Chown directory for irods-ires2-testres1" {
	run sudo chown -R $USER:$USER /irods-ires2-testres1
	echo $output
	[ $status = 0 ]
}

@test "Check that iadmin can create irods-ires2-testres1 on ires1" {
	run iadmin mkresc irods-ires2-testres1 'unix file system' cache ires1 /irods-ires2-testres1
	echo $output
	[ $status = 0 ]
}

@test "Create directory for irods-ires2-testres2" {
	run sudo mkdir -p /irods-ires2-testres2
	echo $output
	[ $status = 0 ]
}

@test "Chown directory for irods-ires2-testres2" {
	run sudo chown -R $USER:$USER /irods-ires2-testres2
	echo $output
	[ $status = 0 ]
}

@test "Check that iadmin can create irods-ires2-testres2 on ires1" {
	run iadmin mkresc irods-ires2-testres2 'unix file system' cache ires1 /irods-ires2-testres2
	echo $output
	[ $status = 0 ]
}
