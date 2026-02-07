#!/usr/bin/bash

# Step 1: Create secure_vault directory 
mkdir -p "secure_vault"

# Step 2: Create required files inside the directory
touch "secure_vault/keys.txt"
touch "secure_vault/secrets.txt"
touch "secure_vault/logs.txt"

# Step 3: Add welcome messages using I/O redirection
echo "Welcome to the Keys File - Store encryption keys here" > "secure_vault/keys.txt"
echo "Welcome to the Secrets File - Store confidential data here" > "secure_vault/secrets.txt"
echo "Welcome to the Logs File - System logs will be recorded here" > "secure_vault/logs.txt"

# Step 4: Print success message
echo "Secure vault setup completed successfully!"

# Step 5: List all files in long format
ls -l "secure_vault"



