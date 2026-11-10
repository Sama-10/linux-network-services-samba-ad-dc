#!/bin/bash
# ============================================
# Create Organizational Units
# Domain: it16.local
# Author: IT24100816
# ============================================

echo "========================================="
echo "CREATING ORGANIZATIONAL UNITS"
echo "========================================="

# Create Admins OU
echo "[1/3] Creating Admins OU..."
sudo samba-tool ou create "OU=Admins,DC=it16,DC=local"

# Create Staff OU
echo "[2/3] Creating Staff OU..."
sudo samba-tool ou create "OU=Staff,DC=it16,DC=local"

# Create Students OU
echo "[3/3] Creating Students OU..."
sudo samba-tool ou create "OU=Students,DC=it16,DC=local"

echo ""
echo "========================================="
echo "OU CREATION COMPLETE!"
echo "========================================="
echo ""
echo "Available OUs:"
sudo samba-tool ou list