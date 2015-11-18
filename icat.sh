#!/bin/bash 

GREEN='\033[0;32m'

printf "${GREEN}'%*s\n'" "${COLUMNS:-$(tput cols)}" '' | tr ' ' \#
printf "${GREEN}'%*s\n'" "${COLUMNS:-$(tput cols)}" '' | tr ' ' \#
bats icommands.bats
printf "${GREEN}'%*s\n'" "${COLUMNS:-$(tput cols)}" '' | tr ' ' \#
printf "${GREEN}'%*s\n'" "${COLUMNS:-$(tput cols)}" '' | tr ' ' \#
bats icat_resource.bats
