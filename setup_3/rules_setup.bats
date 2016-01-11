#!/usr/bin/env bats

#tests to setup the assorted rules we want to check
# must have run the tests that setup resources and resource groups first

@test "install rule acSetRescSchemeForCreate.re" {

	run cp setup_3/rules/acSetRescSchemeForCreate.re /usr/local/iRODS/server/config/reConfigs/
	[ $status = "0" ]
}
# TODO: How do we test this?

@test "install rule acPostProcForOpen.re" {
	skip "this is a rule on irods-g1-dev, not production"
	run cp setup_3/rules/acPostProcForOpen.re /usr/local/iRODS/server/config/reConfigs/
	[ $status = "0" ]
}
# TODO: How do we test this?

@test "install JJN's modified rule acPostProcForPut.re" {

	run cp setup_3/rules/acPostProcForPut.re /usr/local/iRODS/server/config/reConfigs/
	[ $status = "0" ]
}

@test "install rule acPreprocForDataObjOpen.re" {

	run cp setup_3/rules/acPreprocForDataObjOpen.re /usr/local/iRODS/server/config/reConfigs/
	[ $status = "0" ]
}

@test "install rule acTrashPolicy.re" {

	run cp setup_3/rules/acTrashPolicy.re /usr/local/iRODS/server/config/reConfigs/
	[ $status = "0" ]
}


@test "Overwrite core.re" {

	run cp setup_3/rules/core.re /usr/local/iRODS/server/config/reConfigs/
	[ $status = "0" ]
}


