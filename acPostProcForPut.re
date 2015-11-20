 pc7 addition, replicate data either way
# dest dep on where data lands

acPostProcForPut {
  on($rescGroupName == "seq-green") {
    msiSysChksumDataObj;
    msiSysReplDataObj("seq-red","null");
  }
  on ($rescGroupName == "seq-red") {
    msiSysChksumDataObj;
    msiSysReplDataObj("seq-green","null");
  }
}