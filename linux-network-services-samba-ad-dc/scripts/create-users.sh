#!/bin/bash
# ============================================
# Create Domain Users
# Domain: it16.local
# Author: IT24100816
# ============================================

echo "========================================="
echo "CREATING DOMAIN USERS"
echo "========================================="

# Passwords
ADMIN_PASS="Admin@123"
STAFF_PASS="Staff@123"
STUDENT_PASS="Student@123"

# Create Admin Users
echo "[1/3] Creating Admin users..."
for i in 1 2 3; do
    echo "  Creating admin$i..."
    sudo samba-tool user create admin$i $ADMIN_PASS \
        --given-name="Admin" --surname="User$i" \
        --userou="OU=Admins" 2>/dev/null || echo "  admin$i already exists"
    sudo samba-tool user setexpiry admin$i --noexpiry 2>/dev/null
done

# Create Staff Users
echo "[2/3] Creating Staff users..."
for i in 1 2 3; do
    echo "  Creating staff$i..."
    sudo samba-tool user create staff$i $STAFF_PASS \
        --given-name="Staff" --surname="User$i" \
        --userou="OU=Staff" 2>/dev/null || echo "  staff$i already exists"
    sudo samba-tool user setexpiry staff$i --noexpiry 2>/dev/null
done

# Create Student Users
echo "[3/3] Creating Student users..."
for i in 1 2 3; do
    echo "  Creating student$i..."
    sudo samba-tool user create student$i $STUDENT_PASS \
        --given-name="Student" --surname="User$i" \
        --userou="OU=Students" 2>/dev/null || echo "  student$i already exists"
    sudo samba-tool user setexpiry student$i --noexpiry 2>/dev/null
done

echo ""
echo "========================================="
echo "USER CREATION COMPLETE!"
echo "========================================="
echo ""
echo "All Domain Users:"
sudo samba-tool user list | grep -E "admin|staff|student"