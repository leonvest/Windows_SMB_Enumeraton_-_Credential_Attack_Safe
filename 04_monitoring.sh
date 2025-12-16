# Example detection rule for SMB brute force
detection:
  selection:
    EventID: 4625
    LogonType: 3
    AuthenticationPackage: NTLM
    WorkstationName: '*'
  timeframe: 5m
  condition: selection | count() by TargetUserName > 10
