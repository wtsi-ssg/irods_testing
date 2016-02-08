
*THIS IS A WORK IN PROGESS*

Exploring upgrading from iRODS 3.3.1 to iRODS 4.1.X, this repo contains a BATS test 
harness that aims to test both pre and post upgrade functionality. We're also using it to test iRODS 4.1.X installed via packages, as well as after upgrades, so it aims to cover both 3.3.1 and 4.1.X functionality & changes.

The long term aim is to get tests we can also use for a Continus Integration system, but thats not what this is aimed at.


Setup
=====

After cloning the repo you need to install bats:  
cd irods_testings/bats/  
./install.sh /usr/local/


Test Methodology
================

For testing iRODS 3.3.1
-----------------------

ssh onto the iCAT server

cd irods_testing
./scripts/v3/icat/setup


ssh onto each iRES server in turn
cd irods_testing
./scripts/v3/ires/setup

ssh back onto the iCAT server 

cd irods_testing
./scripts/v3/icat/tests



For testing iRODS 4.1.x
-----------------------

ssh onto the iCAT server

cd irods_testing
./scripts/v4/icat/setup


ssh onto each iRES server in turn
cd irods_testing
./scripts/v4/ires/setup

ssh back onto the iCAT server 

cd irods_testing
./scripts/v4/icat/tests

To Do
-----

  1. ssh on and run the scripts automatically
