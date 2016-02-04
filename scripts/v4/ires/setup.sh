#!/bin/bash

ARRAY=(./bats_scripts/icommands.bats ./setup_4/ires_resource.bats)

for FILE in ${ARRAY[@]};do
        echo $FILE
	bats $FILE
done
