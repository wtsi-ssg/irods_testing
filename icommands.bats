#!/usr/bin/env bats

setup() {
	PATH=$PATH:/usr/local/iRODS/clients/icommands/bin
}

#tests use iput, iget, ils, ipwd
@test "Check the output of ils" {
	run ils
	echo ${lines[0]}
	 [[ ${lines[0]} =~ "/tempZone/home/rods:" ]]
}

@test "Check the output of ipwd" {
	run ipwd
	echo $output
	[ $output = "/tempZone/home/rods"]
}

@test "make a collection" {
	run imkdir /TestCol
	echo $output
	[ $output = "/tempZone/home/rods"]
}

@test "remove a collection" {
	run irm /TestCol
	echo $output
	[ $output = "/tempZone/home/rods"]
}

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
