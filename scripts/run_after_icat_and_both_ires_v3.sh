#!/bin/bash 


ARRAY=( ./setup_3/resourcegroups_setup.bats ./setup_3/rules_setup.bats )

for FILE in ${ARRAY[@]};do
	bats $FILE
done
