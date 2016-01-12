#/bin/bash 

NUM_FILES=$2

#logarithmic scale test in MB
for i in 1 10 100; do 
	./gen_files.sh "$NUM_FILES" "$i"
	for mode in iput irm iget; do
		./iput_iget.sh "$mode" "$NUM_FILES" "$1" | tee  "$mode""_log_$i.log"
	done

done
