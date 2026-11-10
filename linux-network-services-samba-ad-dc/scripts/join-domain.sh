#!/bin/bash
# ============================================
# Join Ubuntu Client to Domain
# Domain: it16.local
# Author: IT24100816
# ============================================

set -e

echo "========================================="
echo "JOINING CLIENT TO DOMAIN"
echo "Domain: it16.local"
echo "========================================="

# Configuration
DC_IP="192.168.16.103"
DOMAIN="it16.local"
REALM="IT16.LOCAL"
ADMIN_USER="Administrator"

# Step 1: Configure DNS
echo "[1/5] Configuring DNS to point to DC..."
sudo chattr -i /etc/resolv.conf 2>/dev/null || true
sudo tee /etc/resolv.conf << EOF
nameserver $DC_IP
search $DOMAIN
EOF
sudo chattr +i /etc/resolv.conf

# Step 2: Install required packages
echo "[2/5] Installing domain join packages..."
sudo apt update
sudo apt install -y realmd sssd sssd-tools adcli krb5-user \
  libnss-sss libpam-sss samba-common-bin

# Step 3: Discover domain
echo "[3/5] Discovering domain..."
sudo realm discover $DOMAIN

# Step 4: Join domain
echo "[4/5] Joining domain..."
echo "Please enter the Administrator password when prompted."
sudo realm join --user=$ADMIN_USER $DOMAIN

# Step 5: Verify
echo "[5/5] Verifying domain join..."
sudo realm list

echo ""
echo "========================================="
echo "DOMAIN JOIN COMPLETE!"
echo "========================================="
echo ""
echo "Test domain authentication with:"
echo "  su - admin1@$DOMAIN"
echo "  whoami"