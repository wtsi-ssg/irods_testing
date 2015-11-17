#!/usr/bin/env bats

setup() {
	PATH=$PATH:/usr/local/iRODS/clients/icommands/bin
}

##tests use iput, iget, ils, ipwd
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
	iput -K $FILENAME
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
	run iget -K $FILENAME
	[ $status = 0 ]
	[ -e $FILENAME ]
}

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
