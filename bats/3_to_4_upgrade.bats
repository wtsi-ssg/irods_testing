
#post 3-4 upgrade tests

@test "Check that ten users are in testgroup1" {
        run iadmin lg testgroup1 | wc -l
         [[ ${lines[0]} =~ "10" ]]
}