#create the .irodsA file for the quotatestaccount2

@setup() {
    export irodsEnvFile='/home/vagrant/.irods/.irodsEnv_quotatestaccount2'
    export irodsAuthFileName='/home/vagrant/.irods/.irodsA_quotatestaccount2'
}

@test "run iinit for quotatestaccount2 to create .irodsEnv and .irodsA files" {
    run iinit <<< "quotatestgroup1"
    [ "$status" -eq 0 ]
}

@teardown() {
    unset irodsEnvFile
    unset irodsAuthFileName
}

