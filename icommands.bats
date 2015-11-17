#!/usr/bin/env bats

#tests use iput, iget, ils, ipwd
@test "Check the output of ils" {
	run ils
	 [[ ${lines[0]} =~ "/tempzone/home/irods:" ]]
}

#should I do a status check rather than output?
@test "Check the output of ipwd" {
	run ipwd
	[ $output = "/tempzone/home/irods"]
}

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