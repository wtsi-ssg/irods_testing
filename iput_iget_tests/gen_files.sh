#!/bin/bash -x


re='^[0-9]+$'
for i in $1 $2;do 
    if ! [[ $i =~ $re ]] ; then
        echo "error: Not a number" >&2; exit 1
    fi
done


NUM_FILE=$1
SIZE_FILE=$2

if [ $1 -lt 10 ]; then
    PAD="0"
else 
    PAD=""
fi


mkdir /tmp/random_files.dir

cd /tmp/random_files.dir

for i in $(seq -w "$PAD""$NUM_FILE")
do
    dd if=/dev/urandom of=random_file_128M_$i bs=1M count=$SIZE_FILE
done

md5sum /tmp/random_files.dir/random_file_128M_* > ../random_files.md5
