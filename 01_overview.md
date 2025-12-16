# Windows SMB Enumeration & Attack Overview

## 🎯 Core Concepts You Need to Understand

---

## 1. SMB Protocol Fundamentals

### What is SMB?
- Server Message Block – Windows file/print sharing protocol
- Primary ports: **445** (Direct) and **139** (NetBIOS over TCP)
- Versions: **SMB1** (deprecated), **SMB2**, **SMB3** (current)

### Key Components
- **Shares:** Network resources (ADMIN$, C$, IPC$, etc.)
- **IPC$:** Inter-process communication share (critical for enumeration)
- **Authentication:** NTLM or Kerberos
- **Domain vs Workgroup:** Centralized vs decentralized authentication

---

## 2. Windows Active Directory Basics
- **Domain Controller:** Central authentication server
- **Domain Users:** Accounts in a Windows domain
- **Service Accounts:** Special accounts for services/applications
- **Built-in Accounts:** Administrator, Guest, krbtgt (Kerberos)

---

## 3. Authentication Mechanisms
- **NTLM:** Older challenge-response protocol
- **Kerberos:** Ticket-based authentication (more secure)
- **Null Sessions:** Anonymous access (often disabled)
- **Pass-the-Hash:** Using hashes instead of passwords

---

## 4. Common SMB Shares

| Share     | Purpose                         | Security Implications        |
|-----------|---------------------------------|------------------------------|
| ADMIN$    | Remote administration           | Full system access           |
| C$        | Root of C: drive                | Full file system access      |
| IPC$      | Inter-process communication     | Enumeration / pipe access    |
| NETLOGON  | Domain logon scripts            | Often contains scripts       |
| SYSVOL    | Domain policies                 | Group Policy information    |
