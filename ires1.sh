#!/bin/bash

GREEN='\033[0;32m'

ARRAY=(icommands.bats ires1_resource.bats)

for FILE in ${ARRAY[@]};do
        printf "${GREEN}%*s\n" "${COLUMNS:-$(tput cols)}" '' | tr ' ' \#
        printf "${GREEN}%*s\n" "${COLUMNS:-$(tput cols)}" '' | tr ' ' \#
	bats $FILE
done
