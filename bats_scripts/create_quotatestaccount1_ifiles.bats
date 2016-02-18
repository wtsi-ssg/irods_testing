#Create all the .irods files needed for the quotatestaccount2 account

@test "set password for quotatestaccount1" {
        run iadmin moduser quotatestaccount1 password quotatestaccount1 
       [ $status = "0" ]
}

@test "create quotatestaccount2 .irodsEnv file" {
        run cp files/.irodsEnv_quotatestaccount1 ~/.irods/.irodsEnv_quotatestaccount1
       [ $status = "0" ]
}


