#!/bin/bash 

ARRAY=(./bats/icommands.bats ./setup3/icat_resource.bats ./bats/useraccounts.bats)

for FILE in ${ARRAY[@]};do
	echo $FILE
	bats $FILE
done
