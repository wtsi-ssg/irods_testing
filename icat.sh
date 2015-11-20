#!/bin/bash 

GREEN='\033[0;32m'

ARRAY=(icommands.bats icat_resource.bats resourcegroups_setup.bats)

for FILE in ${ARRAY[@]};do
	printf "${GREEN}%*s\n" "${COLUMNS:-$(tput cols)}" '' | tr ' ' \#
	printf "${GREEN}%*s\n" "${COLUMNS:-$(tput cols)}" '' | tr ' ' \#
	bats $FILE
done
