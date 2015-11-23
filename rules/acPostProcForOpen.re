# pc7 test log auditing
#acPostProcForOpen {writeLine("serverLog",$objPath); }
acPostProcForOpen {
 acAuditEvent("acPostProcForOpen", $objPath, $rescName);
}