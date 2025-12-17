# Disable SMBv1
Set-SmbServerConfiguration -EnableSMB1Protocol $false

# Require SMB signing
Set-SmbServerConfiguration -RequireSecuritySignature $true

# Restrict anonymous access
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters" -Name "RestrictNullSessAccess" -Value 1
