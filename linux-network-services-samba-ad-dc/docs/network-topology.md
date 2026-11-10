# Network Topology

## Network Diagram
```mermaid
graph TD
    subgraph "VirtualBox Internal Network: 192.168.16.0/24"
        DC["<b>Ubuntu Server (Domain Controller)</b><br>dc1.it16.local<br>IP: 192.168.16.103 (Static)<br><br><b>Services:</b><br>- Samba AD DC<br>- DNS & Kerberos<br>- DHCP Server<br>- Web Server"]
        
        C1["<b>Client 1 (Ubuntu)</b><br>client-1<br>IP: DHCP Assigned<br>DNS: 192.168.16.103"]
        
        C2["<b>Client 2 (Ubuntu)</b><br>client-2<br>IP: DHCP Assigned<br>DNS: 192.168.16.103"]
        
        DC ---|Auth & DHCP| C1
        DC ---|Auth & DHCP| C2
    end


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
