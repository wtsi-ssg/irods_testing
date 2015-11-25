#!/bin/bash 


ARRAY=( ./setup_3/resourcegroups_setup.bats )

for FILE in ${ARRAY[@]};do
	bats $FILE
done
