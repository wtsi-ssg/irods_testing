#!/bin/bash

ARRAY=(./bats/icommands.bats ./setup_3/ires_resource.bats)

for FILE in ${ARRAY[@]};do
        echo $FILE
	bats $FILE
done
