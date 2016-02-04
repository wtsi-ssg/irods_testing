#!/usr/bin/env bats

@setup() {
	 export PATH=$PATH:/opt/oracle/instantclient_11_2/bin
}

#Oracle database specific tests
@test "confirm the database has data" {
	run sqlplus irods/rods@db < database_tests/Confirm_Data_In_iRODS_Database.sql
        echo $output	
	[ $status = "0" ]
}