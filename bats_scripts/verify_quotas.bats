#verify that the quota settings have been made on test user and group

@test "Verify Quota on User" {
        run iadmin lq quotatestaccount2
        [[ ${lines[5]} =~ "quota_limit: 100" ]]
}


@test "Verify Quota on Group" {
        run iadmin lq quotatestgroup1
        [[ ${lines[5]} =~ "quota_limit: 200" ]]
}

@test "Regenerate quota usage before adding files" {
        run iadmin cu
       [ $status = "0" ]
}

@test "Attempt to upload file larger than quota for quotatestaccount2" {
        run 
}
