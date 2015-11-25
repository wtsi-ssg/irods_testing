#!/usr/bin/env bats

#tests to setup the assorted rules we want to check
# must have run the tests that setup resources and resource groups first

@test "install rule acSetRescSchemeForCreate.re" {

	run cp rules/acSetRescSchemeForCreate.re /usr/local/iRODS/server/config/reConfigs/
	[ $status = "0" ]
}
# TODO: How do we test this?

@test "install rule acPostProcForOpen.re" {
	skip "this is a rule on irods-g1-dev, not production"
	run cp rules/acPostProcForOpen.re /usr/local/iRODS/server/config/reConfigs/
	[ $status = "0" ]
}
# TODO: How do we test this?

@test "install JJN's modified rule acPostProcForPut.re" {

	run cp rules/acPostProcForPut.re /usr/local/iRODS/server/config/reConfigs/
	[ $status = "0" ]
}

@test "install rule acPreprocForDataObjOpen.re" {

	run cp rules/acPreprocForDataObjOpen.re /usr/local/iRODS/server/config/reConfigs/
	[ $status = "0" ]
}

@test "install rule acTrashPolicy.re" {

	run cp rules/acTrashPolicy.re /usr/local/iRODS/server/config/reConfigs/
	[ $status = "0" ]
}


@test "Overwrite core.re" {

	run cp rules/core.re /usr/local/iRODS/server/config/reConfigs/
	[ $status = "0" ]
}


