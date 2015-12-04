#!/bin/bash

RESOURCE=demoResc
N=16 # num files

mkdir -p benchmarks.dir
imkdir -p benchmarks.coll

cd random_files.dir

for i in random_file.128M.*
do
    echo iput -R ${RESOURCE} -K -f $PWD/$i benchmarks.coll/
done > ../benchmarks.dir/iput-all

for i in random_file.128M.*
do
    echo iget -R ${RESOURCE} -f benchmarks.coll/$i
done > ../benchmarks.dir/iget-all

# Benchmark
cd ../benchmarks.dir

for i in `seq -w $N`
do
    echo
    echo $i iput jobs:
    date
    cat iput-all | parallel --jobs $i --joblog iput.$i.log
    date
    echo $i iget jobs:
    date
    cat iget-all | parallel --jobs $i --joblog iget.$i.log
    date
    md5sum random_file.128M.* > /tmp/benchmark.md5
    rm -f random_file.128M.*
    echo Checksum errors: `comm -2 -3 <(sort ../random_files.md5) <(sort /tmp/benchmark.md5) | wc -l`
    sleep 5
done 2>&1 | tee benchmark.log
