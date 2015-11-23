#!/usr/bin/env bats

#tests to setup the assorted rules we want to check
# must have run the tests that setup resources and resource groups first

@test "install rule acPostProcForOpen.re" {

	run cp acPostProcForOpen.re /usr/local/iRODS/server/config/reConfigs/
	[ $status = "0" ]
}
# TODO: How do we test this?

@test "install JJN's modified rule acPostProcForPut.re" {

	run cp acPostProcForPut.re /usr/local/iRODS/server/config/reConfigs/
	[ $status = "0" ]
}

@test "install rule acPreprocForDataObjOpen.re" {

	run cp acPreprocForDataObjOpen.re /usr/local/iRODS/server/config/reConfigs/
	[ $status = "0" ]
}

@test "install rule acTrashPolicy.re" {

	run cp acTrashPolicy.re /usr/local/iRODS/server/config/reConfigs/
	[ $status = "0" ]
}


@test "Overwrite core.re" {

	run cp core.re /usr/local/iRODS/server/config/reConfigs/
	[ $status = "0" ]
}


