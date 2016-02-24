#test that quotas work for a single user
# needs to have the following run first
# quota_setup.bats
# setup_quotatestaccount2_authentication.bats

setup() {
    export IRODS_ENVIRONMENT_FILE='/home/vagrant/.irods/irods_environment.json_quotatestaccount2'
    export IRODS_AUTHENTICATION_FILE='/home/vagrant/.irods/.irodsA_quotatestaccount2'
    dd if=/dev/zero of=/tmp/quotatestaccount2_test bs=1b count=101
}

@test "Confirm Failure to upload file larger than quota for quotatestaccount2" {
    run iput -K /tmp/quotatestaccount2_test
    [ "$status" -eq 3 ]
}

teardown() {
    unset IRODS_ENVIRONMENT_FILE
    unset IRODS_AUTHENTICATION_FILE
    rm /tmp/quotatestaccount2_test
}

