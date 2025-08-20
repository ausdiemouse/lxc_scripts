#!/bin/bash

echo "Fixing repository sources for $(hostname)..."

# Backup original sources.list
cp /etc/apt/sources.list /etc/apt/sources.list.backup.$(date +%Y%m%d)

# Replace 'stable' with 'bookworm' in main sources.list
sed -i 's/stable/bookworm/g' /etc/apt/sources.list

# Replace 'stable' with 'bookworm' in any additional repository files
# Use 2>/dev/null to suppress errors if directory is empty
sed -i 's/stable/bookworm/g' /etc/apt/sources.list.d/*.list 2>/dev/null || true

echo "Repository sources updated for $(hostname)"
echo "Backup saved as: /etc/apt/sources.list.backup.$(date +%Y%m%d)"

# Update package lists with the new repositories
echo "Updating package lists..."
apt update

echo "Repository fix completed for $(hostname)"