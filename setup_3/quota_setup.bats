# setup quotas on system

@test "Install rule for enabling quotas" {
    echo $output
    echo $status
    [ $status = 0 ]
}

@test "Add quotatestaccount1" {
        run iadmin mkuser quotatestaccount1 rodsuser
    echo $output        
        [ $status = "0" ]
}


@test "Add quotatestaccount2" {
        run iadmin mkuser quotatestaccount2 rodsuser
    echo $output        
        [ $status = "0" ]
}

@test "Add quotatestgroup1" {
        run iadmin mkgroup quotatestgroup1
    echo $output        
        [ $status = "0" ]
}

@test "Add testuser1 to testgroup1" {
        run iadmin atg quotatestgroup1 quotatestaccount1 
    echo $output        
        [ $status = "0" ]
}
