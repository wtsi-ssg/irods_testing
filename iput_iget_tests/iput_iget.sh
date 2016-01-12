#!/bin/bash

RESOURCE=$3

re='^[0-9]+$'
if ! [[ $2 =~ $re ]] ; then
    echo "error: Not a number" >&2; exit 1
fi

if [ "$1" !=  "iput" ] && [ "$1" != "iget" ] && [ "$1" != "irm" ]  ;then
    echo "error: Not 'iput', 'iget' or 'irm'" 
    exit 1
else
    MODE="$1"  
fi

if [ "$2" -lt "10" ]; then
    PAD="0"
else 
    PAD=""
fi
mkdir -p /tmp/benchmarks.dir


cd /tmp/random_files.dir

rm /tmp/benchmarks.dir/iput-all /tmp/benchmarks.dir/iget-all /tmp/benchmarks.dir/irm-all
for i in $(seq -w "$PAD""$2")
do
    echo iput -R "${RESOURCE}" -K -f "$PWD"/random_file_128M_"$i"   >> /tmp/benchmarks.dir/iput-all
    echo iget -R "${RESOURCE}" -K -f random_file_128M_"$i" >> /tmp/benchmarks.dir/iget-all
    echo "irm random_file_128M_""$i" >> /tmp/benchmarks.dir/irm-all
done

cd /tmp/benchmarks.dir



if [ "$MODE" == "iput" ]; then
  READY=true
else
  READY=false
fi 

for i in $(seq -w "$PAD""$2")
  do
    if [ "$MODE" == "irm" ]; then
         eval "$(sed "${i:1:2}q;d" "/tmp/benchmarks.dir/irm-all")"  
    elif [ "$MODE" == "iget" ]; then
      eval "$(sed "${i:1:2}q;d" "/tmp/benchmarks.dir/iput-all")"
      if [ "$i" == "$N" ]; then
        READY=true
      fi
    fi


    if [ $READY ]; then

      echo "$i" "$MODE" jobs:
      date
      cat "$MODE""-all" | head "-""$i" | parallel --jobs "$i" --joblog "$MODE"".""$i"".""log"
      date
      md5sum /tmp/random_files.dir/random_file_128M_* | head "-""$i" > /tmp/benchmark.md5
      cat /tmp/random_files.md5 | head "-""$i" > /tmp/sorted_random_files.md5
      echo Checksum errors: "$(comm -2 -3 /tmp/sorted_random_files.md5   /tmp/benchmark.md5 | wc -l )"    
      sleep 5
    fi

done 2>&1 | tee benchmark.log
