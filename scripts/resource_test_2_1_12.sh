#/bin/bash 


iadmin mkresc root replication

iadmin mkresc Sanger random
iadmin mkresc JSDC random

iadmin addchildtoresc root Sanger
iadmin addchildtoresc root JSDC  

iadmin addchildtoresc Sanger ires1Resource
iadmin addchildtoresc Sanger ires2Resource
iadmin addchildtoresc JSDC ires3Resource
iadmin addchildtoresc JSDC ires4Resource

mkdir /tmp/test_repl/
cd /tmp/test_repl/

for i in `seq -w 10`; do 
dd if=/dev/urandom/ of=test_repl_file_$i bs=1M count=10
done

for FILE in *; do 
print iput number $FILE
iput -R root -K -f $FILE
done

IRES1_FILES=$(ils -l | grep ires1Resource | wc -l)
IRES2_FILES=$(ils -l | grep ires2Resource | wc -l)
IRES3_FILES=$(ils -l | grep ires3Resource | wc -l)
IRES4_FILES=$(ils -l | grep ires4Resource | wc -l)

SANGER_FILES=$(( $IRES1_FILES + $IRES2_FILES ))
JSDC_FILES=$(( $IRES3_FILES + $IRES4_FILES ))

if [ "$SANGER_FILES" == "20" ] && [ "$JSDC_FILES" == "20" ];then
	echo "replication is a success"
else
	echo "replication is unbalanced"
fi

if [ $IRES1_FILES == $IRES2_FILES ]; then
	echo "Resource allocation is potentially non-random as there are equal number of files under the Sanger resource, 
	however this could be coincidence"
fi

