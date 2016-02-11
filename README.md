
*THIS IS A WORK IN PROGESS*

Exploring upgrading from iRODS 3.3.1 to iRODS 4.1.X, this repo contains a BATS test 
harness that aims to test both pre and post upgrade functionality. We're also using it to test iRODS 4.1.X installed via packages, as well as after upgrades, so it aims to cover both 3.3.1 and 4.1.X functionality & changes.

The long term aim is to get tests we can also use for a Continus Integration system, but thats not what this is aimed at.


Setup
=====

After cloning the repo you need to install bats:  
```
#this doesnt work ATM..
cd irods_testings/bats/; ./install.sh /usr/local/
#this does
cd ~
git clone https://github.com/sstephenson/bats.git
cd bats
sudo ./install.sh /usr/local
```

Test Methodology
================

For testing iRODS 3.3.1
-----------------------

ssh onto the iCAT server
```
cd ~
git clone https://github.com/sstephenson/bats.git
cd bats
sudo ./install.sh /usr/local
cd ~; git clone https://github.com/wtsi-ssg/irods_testing.git
cd irods_testing; ./scripts/v3/icat/setup
```

ssh onto each iRES server in turn
```
cd ~
git clone https://github.com/sstephenson/bats.git
cd bats
sudo ./install.sh /usr/local
cd ~; git clone https://github.com/wtsi-ssg/irods_testing.git
cd irods_testing; ./scripts/v3/ires/setup.sh
```
ssh back onto the iCAT server 
```
cd irods_testing; ./scripts/v3/icat/tests
```


For testing iRODS 4.1.x
-----------------------

ssh onto the iCAT server
```
cd ~
git clone https://github.com/sstephenson/bats.git
cd bats
sudo ./install.sh /usr/local
cd ~; git clone https://github.com/wtsi-ssg/irods_testing.git
cd irods_testing; ./scripts/v4/icat/setup
```

ssh onto each iRES server in turn
```
cd ~
git clone https://github.com/sstephenson/bats.git
cd bats
sudo ./install.sh /usr/local
cd ~; git clone https://github.com/wtsi-ssg/irods_testing.git
cd irods_testing; ./scripts/v4/ires/setup
```
ssh back onto the iCAT server 
```
cd irods_testing; ./scripts/v4/icat/tests
```

Example Output
--------------
```
./scripts/v3/icat/setup
./bats_scripts/icommands.bats
 ✓ Check the output of ils
 ✓ Check the output of ipwd
 ✓ make a collection
 ✓ remove a collection
 ✓ Check that iput stores a txt document correctly
 ✓ Check that iget can retrieve the txt document correctly
 ✓ Add Metadata
 ✓ List Metadata
 ✓ remove temporary file using irm
 ✓ clean up

10 tests, 0 failures
./bats_scripts/icat_resource.bats
 ✓ Check that iadmin can create a throwaway resource group
 ✓ Check that iadmin can remove a resource from a throwaway resource group

2 tests, 0 failures
./bats_scripts/useraccounts.bats
 ✓ Add an account
 ✓ remove an account

2 tests, 0 failures
./bats_scripts/simple_group_tests.bats
 ✓ Add scrachgroup
 ✓ Add an account
 ✓ Add testuser1 to scratchgroup
 ✓ remove testuser1 from scratchgroup
 ✓ remove an account
 ✓ remove scratchgroup1

6 tests, 0 failures

...

vagrant@ires1:~/irods_testing$ ./scripts/v3/ires/setup.sh
./bats_scripts/icommands.bats
 ✓ Check the output of ils
 ✓ Check the output of ipwd
 ✓ make a collection
 ✓ remove a collection
 ✓ Check that iput stores a txt document correctly
 ✓ Check that iget can retrieve the txt document correctly
 ✓ Add Metadata
 ✓ List Metadata
 ✓ remove temporary file using irm
 ✓ clean up

10 tests, 0 failures
./setup_3/ires_resource.bats
 ✓ Create directory for irods-ires1-testres1
 ✓ Chown directory for irods-ires1-testres1
 ✓ Check that iadmin can create irods-ires1-testres1 on ires1
 ✓ Create directory for irods-ires1-testres2
 ✓ Chown directory for irods-ires1-testres2
 ✓ Check that iadmin can create irods-ires1-testres2 on ires2

6 tests, 0 failures

```

To Do
-----

  1. ssh on and run the scripts automatically
