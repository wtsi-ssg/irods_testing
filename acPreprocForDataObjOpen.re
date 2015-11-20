#pc7 Removed to prevent masking of following entry
#acPreprocForDataObjOpen { }
## TEST 1.2.24, 2.1.15, 2.2.15
# pc7 Addition, Allow all hosts to serve data
# select read host at rnd.

acPreprocForDataObjOpen {
  msiSortDataObj("random");
}