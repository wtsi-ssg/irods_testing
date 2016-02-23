#upgrade the .irodsEnv files for the all test accounts

@test "upgrade irodsEnv file to JSON for vagrant account" {
        run cp files/irods_environment.json.vagrant ~/.irods/irods_environment.json
       [ $status = "0" ]
}

@test "upgrade irodsEnv file to JSON for quotatestaccount1" {
        run cp files/irods_environment.json.quotatestaccount1 ~/.irods/irods_environment.json_quotatestaccount1
       [ $status = "0" ]
}

@test "upgrade irodsEnv file to JSON for quotatestaccount2" {
        run cp files/irods_environment.json.quotatestaccount2 ~/.irods/irods_environment.json_quotatestaccount2
       [ $status = "0" ]
}
