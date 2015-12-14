#!/bin/bash 

ARRAY=(./bats/icommands.bats ./setup4/icat_resource.bats ./bats/useraccounts.bats ./bats/simple_group_tests.bats)

for FILE in ${ARRAY[@]};do
	echo $FILE
	bats $FILE
done
