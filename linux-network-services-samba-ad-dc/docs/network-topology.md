# Network Topology

## Network Diagram
┌─────────────────────────────────────────────────────────────┐ │ VirtualBox Host Machine │ │ │ │ ┌──────────────────────────────────────────────────────┐ │ │ │ Internal Network: 192.168.16.0/24 │ │ │ │ │ │ │ │ ┌─────────────────┐ ┌─────────────────────────┐ │ │ │ │ │ Ubuntu Server │ │ Client 1 (Ubuntu) │ │ │ │ │ │ (dc1.it16) │ │ │ │ │ │ │ │ │ │ IP: DHCP assigned │ │ │ │ │ │ IP: .103 │ │ DNS: 192.168.16.103 │ │ │ │ │ │ (Static) │ │ │ │ │ │ │ │ │ └─────────────────────────┘ │ │ │ │ │ Services: │ │ │ │ │ │ - Samba AD DC │ ┌─────────────────────────┐ │ │ │ │ │ - DNS │ │ Client 2 (Ubuntu) │ │ │ │ │ │ - Kerberos │ │ │ │ │ │ │ │ - Web Server │ │ IP: DHCP assigned │ │ │ │ │ │ │ │ DNS: 192.168.16.103 │ │ │ │ │ └─────────────────┘ └─────────────────────────┘ │ │ │ │ │ │ │ └──────────────────────────────────────────────────────┘ │ │ │ └─────────────────────────────────────────────────────────────┘


## IP Address Allocation

| Device | Hostname | IP Address | Assignment |
|--------|----------|------------|------------|
| Domain Controller | dc1.it16.local | 192.168.16.103 | Static |
| Client 1 | client-1 | 192.168.16.100-200 | DHCP |
| Client 2 | client-2 | 192.168.16.100-200 | DHCP |

## Services and Ports

| Service | Port | Protocol |
|---------|------|----------|
| DNS | 53 | TCP/UDP |
| Kerberos | 88 | TCP/UDP |
| LDAP | 389 | TCP/UDP |
| SMB | 445 | TCP |
| HTTP | 80 | TCP |

## Domain Information

| Item | Value |
|------|-------|
| Domain | `it16.local` |
| Realm | `IT16.LOCAL` |
| NetBIOS | `IT16` |
| DC Name | `dc1.it16.local` |