#!/bin/bash
# ============================================
# Samba AD DC Setup Script
# Domain: it16.local
# Author: IT24100816
# ============================================

set -e

echo "========================================="
echo "SAMBA ACTIVE DIRECTORY DOMAIN CONTROLLER"
echo "Domain: it16.local"
echo "========================================="

# Step 1: Update system
echo "[1/7] Updating system..."
sudo apt update && sudo apt upgrade -y

# Step 2: Install Samba packages
echo "[2/7] Installing Samba packages..."
sudo apt install -y samba samba-dsdb-modules samba-vfs-modules \
  smbclient winbind libpam-winbind libnss-winbind \
  krb5-user dnsutils chrony acl attr

# Step 3: Stop default Samba services
echo "[3/7] Stopping default Samba services..."
sudo systemctl disable --now smbd nmbd winbind 2>/dev/null || true
sudo systemctl mask smbd nmbd winbind 2>/dev/null || true

# Step 4: Backup existing configuration
echo "[4/7] Backing up existing configuration..."
sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.backup 2>/dev/null || true

# Step 5: Provision the domain
echo "[5/7] Provisioning domain it16.local..."
sudo samba-tool domain provision \
  --use-rfc2307 \
  --realm=IT16.LOCAL \
  --domain=IT16 \
  --server-role=dc \
  --dns-backend=SAMBA_INTERNAL \
  --dns-forwarder=8.8.8.8 \
  --adminpass='Admin@123456'

# Step 6: Copy Kerberos configuration
echo "[6/7] Configuring Kerberos..."
sudo cp /var/lib/samba/private/krb5.conf /etc/krb5.conf

# Step 7: Start Samba AD DC
echo "[7/7] Starting Samba AD DC..."
sudo systemctl unmask samba-ad-dc
sudo systemctl enable --now samba-ad-dc

# Verify
echo ""
echo "========================================="
echo "SETUP COMPLETE!"
echo "========================================="
echo ""
echo "Domain Information:"
sudo samba-tool domain info 127.0.0.1
echo ""
echo "Service Status:"
sudo systemctl status samba-ad-dc --no-pager | head -5