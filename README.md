
*THIS IS A WORK IN PROGESS*

Exploring upgrading from iRODS 3.3.1 to iRODS 4.1.X, this repo contains a BATS test 
harness that aims to test both pre and post upgrade functionality. We're also using it to test iRODS 4.1.X installed via packages, as well as after upgrades, so it aims to cover both 3.3.1 and 4.1.X functionality & changes.

The long term aim is to get tests we can also use for a Continus Integration system, but thats not what this is aimed at.

It relies on having a test infrastructure built (we use Vagrant and Virtualbox, seperate Repo to come, maybe), named like this;

db
icat
ires1
ires2

once iRODS is installed on all icat, and both ires servers, the tests are assumed to run on icat, unless otherwise specified (for example, there are some resource setup tests that run on the ires servers).  

Setup
-----

git clone https://github.com/wtsi-ssg/irods_testing.git

Test Plan
---------
In the order of; icat, ires1, ires2, do

cd irods_testing
./test.sh

Once these have passed, on the icat run
./scripts/run_after_icat_and_both_ires.sh

*Note* How we switch between upgrade and post upgrade and setup and post setup tests is still being worked out...
