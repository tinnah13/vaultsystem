#!/bin/bash

VAULT="secure_vault"
REPORT="vault_report.txt"

# Check if directory exists
if [ ! -d "$VAULT" ]; then
    echo "Error: secure_vault directory not found."
    exit 1
fi

# Start report
echo "==== Vault Security Report ====" > "$REPORT"
echo "Generated on: $(date)" >> "$REPORT"
echo "--------------------------------" >> "$REPORT"

# Loop through files
for file in "$VAULT"/*
do
    name=$(basename "$file")
    size=$(stat -c%s "$file")
    modified=$(stat -c%y "$file")
    perm=$(stat -c%a "$file")

    echo "File: $name" >> "$REPORT"
    echo "Size: $size bytes" >> "$REPORT"
    echo "Last Modified: $modified" >> "$REPORT"
    echo "Permissions: $perm" >> "$REPORT"

    # Detect risky permissions
    if [ "$perm" -gt 644 ]; then
        echo "⚠️ SECURITY RISK DETECTED" >> "$REPORT"
    fi

    echo "--------------------------------" >> "$REPORT"
done

# Confirmation message
echo "Vault report created successfully at $REPORT"
