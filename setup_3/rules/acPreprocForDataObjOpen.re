#pc7 Removed to prevent masking of following entry
#acPreprocForDataObjOpen { }

# pc7 Addition, Allow all hosts to serve data
# select read host at rnd.

#acPreprocForDataObjOpen {
#  msiSortDataObj("random");
#}

# gmpc 13/11/14 disable red copy as it is broken
acPreprocForDataObjOpen {
  msiSetDataObjPreferredResc("test-green");
}
