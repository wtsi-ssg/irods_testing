#test that quotas work for a single user
# needs to have the following run first
# setup_3/quota_setup.bats
# setup_3/setup_quotatestaccount1_authentication.bats

setup() {
    export irodsEnvFile='/home/vagrant/.irods/.irodsEnv_quotatestaccount1'
    export irodsAuthFileName='/home/vagrant/.irods/.irodsA_quotatestaccount1'
    dd if=/dev/zero of=/tmp/quotatestaccount1_test bs=1b count=101
}

@test "Confirm Failure to upload file larger than quota for quotatestgroup1 user" {
    run iput -K /tmp/quotatestaccount1_test
    [ "$status" -eq 3 ]
}

teardown() {
    unset irodsEnvFile
    unset irodsAuthFileName
    rm /tmp/quotatestaccount2_test
}

