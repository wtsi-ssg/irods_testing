#!/usr/bin/env bats

#tests use iput, iget, ils, ipwd
@test "Check the output of ils" {
	run ils
	 [[ ${lines[0]} =~ "/tempzone/home/irods:" ]]
}

@test "Check the output of ipwd" {
	run ipwd
	[ $output = "/tempzone/home/irods"]
}

@test "make a collection" {
	run imkdir /TestCol
	[ $output = "/tempzone/home/irods"]
}

@test "remove a collection" {
	run irm /TestCol
	[ $output = "/tempzone/home/irods"]
}


#should we use the setup function here to create a test file to be used later
# as process id will continually change. Does it change for each test?

@test "Check that iput stores a txt document correctly" {
	FILENAME=$$.txt
	touch $FILENAME
	iput -K -V -R $FILENAME
	run ils
	for i in $lines[@]; do
		if [ i = $FILENAME ]; then
			[ true ]
		fi
	done
	[ false ]
}

@test "Check that iget can retrieve the txt document correctly" {
	FILENAME=$$.txt
	run iget $FILENAME
	[ $status = 0 ]
}


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