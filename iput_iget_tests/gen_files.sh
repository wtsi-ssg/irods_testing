#!/bin/bash -x

mkdir /tmp/random_files.dir

cd /tmp/random_files.dir

for i in `seq -w 16`
do
    dd if=/dev/urandom of=random_file.128M.$i bs=1M count=128
done

md5sum /tmp/random_files.dir/random_file.128M.* > ../random_files.md5
