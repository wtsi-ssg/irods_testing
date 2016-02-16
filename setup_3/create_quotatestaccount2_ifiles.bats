#Create all the .irods files needed for the quotatestaccount2 account

@test "set password for quotatestaccount2" {
        run iadmin moduser quotatestaccount2 password quotatestgroup1
       [ $status = "0" ]
}

@test "create quotatestaccount2 .irodsEnv file" {
        run cat > ~/.irods/.irodsEnv_quotatestaccount2 <<EOL
# iRODS server host name:
irodsHost 'icat'
# iRODS server port number:
irodsPort 1247

# Default storage resource name:
irodsDefResource 'demoResc'
# Home directory in iRODS:
irodsHome '/tempZone/home/quotatestaccount2'
# Current directory in iRODS:
irodsCwd '/tempZone/home/quotatestaccount2'
# Account name:
irodsUserName 'quotatestaccount2'
# Zone:
irodsZone 'tempZone'
EOL

       [ $status = "0" ]
}


        [[ ${lines[7]} =~ "quota_limit: 200" ]]
