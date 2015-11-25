#!/usr/bin/env bats


##Start of Resource Tests
@test "Create directory for irods-$( hostname )-testres1" {
	run sudo mkdir -p /irods-$( hostname )-testres1
	echo $output
	echo $status
	[ $status = 0 ]
}

@test "Chown directory for irods-$( hostname )-testres1" {
	run sudo chown -R $USER:$USER /irods-$( hostname )-testres1
	echo $output
	echo Â$status
	[ $status = 0 ]
}

@test "Check that iadmin can create irods-$( hostname )-testres1 on $( hostname )" {
	run iadmin mkresc irods-$( hostname )-testres1 'unix file system' $( hostname ):/irods-$( hostname )-testres1 
	echo $output
	echo $status
	[ $status = 0 ]
}

@test "Create directory for irods-$( hostname )-testres2" {
	run sudo mkdir -p /irods-$( hostname )-testres2
	echo $output
	echo $status
	[ $status = 0 ]
}

@test "Chown directory for irods-$( hostname )-testres2" {
	run sudo chown -R $USER:$USER /irods-$( hostname )-testres2
	echo $output
	echo $status
	[ $status = 0 ]
}

@test "Check that iadmin can create irods-$( hostname )-testres2 on ires2" {
	run iadmin mkresc irods-$( hostname )-testres2 'unix file system' $( hostname ):/irods-$( hostname )-testres2
	echo $output
	echo $status
	[ $status = 0 ]
}
