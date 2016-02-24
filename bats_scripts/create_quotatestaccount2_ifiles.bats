#Create all the .irods files needed for the quotatestaccount2 account

@test "set password for quotatestaccount2" {
        run iadmin moduser quotatestaccount2 password quotatestgroup1
       [ $status = "0" ]
}

@test "create quotatestaccount2 .irodsEnv file" {
        run cp files/.irodsEnv_quotatestaccount2 ~/.irods/.irodsEnv_quotatestaccount2
       [ $status = "0" ]
}


