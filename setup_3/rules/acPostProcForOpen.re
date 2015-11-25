# pc7 test log auditing
#acPostProcForOpen {writeLine("serverLog",$objPath); }
acPostProcForOpen {
 acAuditEvent("acPostProcForOpen", $objPath, $rescName);
}

#jc18 - needs to include the acAuditEvent function that pc7 defined elsewhere in the irods-g1-dev core.re
# but as its dev, we don't actually care for now..