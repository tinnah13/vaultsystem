#!/bin/bash

# Check if secure_vault exists
if [ ! -d "secure_vault" ]; then
    echo "Error: secure_vault directory does not exist."
    exit 1
fi

# Function to update permissions
update_permission() {
    file=$1
    default_perm=$2

    echo "Current permission for $file:"
    ls -l "secure_vault/$file"

    read -p "Do you want to update permission for $file? (yes/no or press Enter for default): " choice

    if [ "$choice" == "yes" ]; then
        read -p "Enter new permission (e.g., 600): " new_perm
        chmod "$new_perm" "secure_vault/$file"
        echo "Permission updated."
    
    elif [ -z "$choice" ]; then
        chmod "$default_perm" "secure_vault/$file"
        echo "Default permission $default_perm applied."
    
    else
        echo "Permission left unchanged."
    fi

    echo "--------------------------------"
}

# Update permissions for each file
update_permission "keys.txt" 600
update_permission "secrets.txt" 640
update_permission "logs.txt" 644

# Display final permissions
echo "Final file permissions:"
ls -l secure_vault
