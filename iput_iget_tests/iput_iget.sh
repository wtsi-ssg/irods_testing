#!/bin/bash

RESOURCE=$3

re='^[0-9]+$'
if ! [[ $2 =~ $re ]] ; then
    echo "error: Not a number" >&2; exit 1
fi

if [ "$1" !=  "iput" ] && [ "$1" != "iget" ]  ;then
    echo "error: Not 'iput' or 'iget'" 
    exit 1
fi

if [ "$2" -lt "10" ]; then
    N=0$2
else 
    N=$2
fi
mkdir -p /tmp/benchmarks.dir


cd /tmp/random_files.dir

rm /tmp/benchmarks.dir/iput-all /tmp/benchmarks.dir/iget-all
for i in `seq -w $N`
do
    echo iput -R ${RESOURCE} -K -f $PWD/random_file_128M_$i   >> /tmp/benchmarks.dir/iput-all
    echo iget -R ${RESOURCE} -K -f random_file_128M_$i >> /tmp/benchmarks.dir/iget-all
done

cd /tmp/benchmarks.dir



  for i in `seq -w $N`
  do
      echo $i $1 jobs:
      date
      cat $1"-all" | head -$i | parallel --jobs $i --joblog $1.$i.log
      date
      md5sum /tmp/random_files.dir/random_file_128M_* | head -$i > /tmp/benchmark.md5
      cat /tmp/random_files.md5 | head -$i > /tmp/sorted_random_files.md5
      echo Checksum errors: $(comm -2 -3 /tmp/sorted_random_files.md5   /tmp/benchmark.md5 | wc -l )    
      sleep 5

done 2>&1 | tee benchmark.log
