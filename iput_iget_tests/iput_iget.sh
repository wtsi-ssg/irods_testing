#!/bin/bash

RESOURCE=replResc
N=16 # num files

mkdir -p /tmp/benchmarks.dir
imkdir -p benchmarks.coll

cd /tmp/random_files.dir

rm /tmp/benchmarks.dir/iput-all /tmp/benchmarks.dir/iget-all
for i in `seq -w $N`
do
    echo iput -R ${RESOURCE} -K -f $PWD/random_file.128M.$i  benchmarks.coll/ >> /tmp/benchmarks.dir/iput-all
    echo iget -R ${RESOURCE} -K -f benchmarks.coll/random_file.128M.$i >> /tmp/benchmarks.dir/iget-all
done

cd /tmp/benchmarks.dir

for mode in "iput" "iget"
do
  for i in `seq -w $N`
  do
      echo $i $mode jobs:
      date
      cat $mode"-all" | head -$i | parallel --jobs $i --joblog $mode.$i.log
      date
      md5sum /tmp/random_files.dir/random_file.128M.* | head -$i > /tmp/benchmark.md5
      echo $( cat /tmp/random_files.md5 | head -$i ) 
      echo $( cat /tmp/benchmark.md5 | head -$i )
      cat /tmp/random_files.md5 | head -$i > /tmp/sorted_random_files.md5
      echo Checksum errors: $(comm -2 -3 /tmp/sorted_random_files.md5   /tmp/benchmark.md5 | wc -l )    
      sleep 5
  done
done 2>&1 | tee benchmark.log
