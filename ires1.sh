#!/bin/bash

ARRAY=(icommands.bats ires1_resource.bats)

for FILE in ${ARRAY[@]};do
        echo $FILE
	bats $FILE
done
