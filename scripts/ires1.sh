#!/bin/bash

ARRAY=(icommands.bats ires_resource.bats)

for FILE in ${ARRAY[@]};do
        echo $FILE
	bats "./bats/"$FILE
done
