#test that quotas work for a single user
# needs to have the following run first
# quota_setup.bats
# setup_quotatestaccount2_authentication.bats

setup() {
    export irodsEnvFile='/home/vagrant/.irods/.irodsEnv_quotatestaccount2'
    export irodsAuthFileName='/home/vagrant/.irods/.irodsA_quotatestaccount2'
    dd if=/dev/zero of=/tmp/quotatestaccount2_test bs=1b count=101
}

@test "Confirm Failure to upload file larger than quota for quotatestaccount2" {
    run iput -K /tmp/quotatestaccount2_test
    [ "$status" -eq 3 ]
}

teardown() {
    unset irodsEnvFile
    unset irodsAuthFileName
    rm /tmp/quotatestaccount2_test
}

