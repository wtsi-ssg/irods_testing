acPostProcForPut {
#
# This is currently on a POC server, the resource group names would change for production systems
#
  on (( $rescGroupName == "test-green" ) &&
        !( $objPath like regex '/seq/illumina/library_merge/.*\.(bam|cram)$' )
  )
  {
    wtsiDoReplication('test-red');
  }
  on (( $rescGroupName == "seq-red" ) &&
        !( $objPath like regex '/seq/illumina/library_merge/.*\.(bam|cram)$' )
  )
  {
    wtsiDoReplication('test-green');
  }
}

wtsiDoReplication(*dest_rg) {
    writeLine("serverLog", "JJN: "++*dest_rg);
# Extract the data name from the object path
    *split_path = split( $objPath, "/" );
    *data_name = elem(*split_path,size(*split_path)-1);

# Convert the object path to a string & store in a local variable    
    *obj_str = str($objPath);
    
# Extract the collection from the object path string    
    *coll_name = trimr(*obj_str, "/");    

# WTSI have non-unique data_names so we need to run the query with a collection path too.
# COUNT(DATA_REPL_NUM) does not appear to work as a query here, tested with:-
#
# *r = getFirstResult(SELECT COUNT(DATA_REPL_NUM) WHERE DATA_NAME = *data_name AND COLL_NAME = *coll_name);
# *ctr = *r.DATA_REPL_NUM;
#
# And this fails with "NOTICE: execRule: no more rules: getFirstResult with status -1018000"
#
# This would simplify the following code if it could be made to work

    *stat = SELECT DATA_REPL_NUM WHERE DATA_NAME = *data_name AND COLL_NAME = *coll_name;
    *ctr = 0;
    foreach( *row in *stat )  {
	*ctr = *ctr + 1;
    }
    # Flags to pass to checksum object microservice
    
    *flags="ChksumAll=++++forceChksum=";
    
    # Flags to pass to object replication microservice
    # dest_rg is passed to this function as the resource group to replicate to.
    #
    *options="verifyChksum=++++destRescName="++*dest_rg;
    
    
    # If we have more than one replica then this is an update operation rather than a create
    if(*ctr > 1) {
        # remove the ChksumAll flag - forceChksum causes the the checksum to be computed even if one exists in iCAT
        # Not sure of the reasoning here.
        *flags="forceChksum=";
        # Add the update replica flag to the object replication microservice
        *options=*options++"++++updateRepl=";
    }
    # Compute checksums
    *err = errormsg( msiDataObjChksum( $objPath, *flags, *chksum ), *msg );
    if( 0 != *err ) {
        failmsg( *err, *msg );
    }
    # update new replicas
    *err = errormsg( msiDataObjRepl( $objPath, *options, *out ), *msg );
    if( 0 != *err ) {
        failmsg( *err, *msg );
    }
}
