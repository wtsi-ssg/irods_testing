#create the .irodsA file for the quotatestaccount1

setup() {
    export irodsEnvFile='/home/vagrant/.irods/.irodsEnv_quotatestaccount1'
    export irodsAuthFileName='/home/vagrant/.irods/.irodsA_quotatestaccount1'
}

@test "run iinit for quotatestaccount1 to create .irodsEnv and .irodsA files" {
    run iinit <<< "quotatestaccount1"
    [ "$status" -eq 0 ]
}

teardown() {
    unset irodsEnvFile
    unset irodsAuthFileName
}

