#!/bin/bash 


ARRAY=( ./bats/replication.bats ./bats/trashcan.bats ./bats/useraccounts.bats  )

for FILE in ${ARRAY[@]};do
	bats $FILE
done
