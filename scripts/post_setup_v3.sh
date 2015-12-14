#!/bin/bash 


ARRAY=( ./bats/replication.bats ./bats/trashcan.bats ./bats/useraccounts.bats  ./bats/multiple_users_groups.bats ./bats/permissions_set.bats)

for FILE in ${ARRAY[@]};do
	bats $FILE
done
