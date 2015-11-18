#!/usr/bin/env bats


##Start of Resource Tests
@test "Create directory for irods-ires1-testres1" {
	run sudo mkdir /irods-ires1-testres1
	[ $status = 0 ]
}

@test "Chown directory for irods-ires1-testres1" {
	run sudo chown -R irods:irods /irods-ires1-testres1
	[ $status = 0 ]
}

@test "Check that iadmin can create irods-ires1-testres1 on ires1" {
	run iadmin mkresc irods-ires1-testres1 'unix file system' cache ires1 /irods-ires1-testres1
	[ $status = 0 ]
}

@test "Create directory for irods-ires1-testres2" {
	run sudo mkdir /irods-ires1-testres2
	[ $status = 0 ]
}

@test "Chown directory for irods-ires1-testres2" {
	run sudo chown -R irods:irods /irods-ires1-testres2
	[ $status = 0 ]
}

@test "Check that iadmin can create irods-ires1-testres2 on ires1" {
	run iadmin mkresc irods-ires1-testres2 'unix file system' cache ires1 /irods-ires1-testres2
	[ $status = 0 ]
}
