#!/bin/bash 

ARRAY=(icommands.bats icat_resource.bats useraccounts.bats)

for FILE in ${ARRAY[@]};do
	echo $FILE
	bats "./bats/"$FILE
done
