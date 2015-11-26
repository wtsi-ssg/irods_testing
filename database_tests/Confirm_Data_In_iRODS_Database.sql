-- show table that should exist if this is a previous iRODS DATABASE
desc R_DATA_MAIN;

-- Show the filenames that have been put into the iCAT previously
select DATA_NAME from R_DATA_MAIN;