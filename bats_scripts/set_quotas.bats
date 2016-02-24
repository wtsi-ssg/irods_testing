#tests for user quotas, enabled in rules_setup.bats and quota_setup.bats


@test "Add a quota to quotatestgroup1" {
    run iadmin sgq quotatestgroup1 total 200
    echo $output    
    [ $status = "0" ]
}

@test "Add a quota to quotatestaccount2" {
    run iadmin suq quotatestaccount2 total 100
    echo $output    
    [ $status = "0" ]
}
