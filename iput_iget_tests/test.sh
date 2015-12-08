#!/bin/bash 

NUM_FILES=16

#logarithmic scale test in MB
for i in 1 10 100; do 
./gen_files.sh NUM_FILES $i
./iput_iget.sh iput $NUM_FILES > iput_log_$i.log
done
