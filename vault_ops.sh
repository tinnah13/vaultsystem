#!/bin/bash

# Set the paths for the secrets and logs files inside secure_vault.

SECRETS_FILE="./secure_vault/secrets.txt"
LOGS_FILE="./secure_vault/logs.txt"

# Create a menu-driven program that runs in a loop until exit.
while true; do
        echo "Vault Operations Menu:"
        echo "1) Add Secret"
        echo "2) Update Secret"
        echo "3) Add Log Entry"
        echo "4) Access Keys"
        echo "5) Exit"

        read -p "Choose an option: " choice

        case $choice in
                1)
                        read -p "Enter(Append) new secret: " secret
                        echo "$secret" >> "$SECRETS_FILE"
                        echo "Secret added"
                        ;;
                2)
			# Ask for existing text to allow update. If they match, user enters new text.
                        read -p "Enter the text to replace: " old_secret
                        if grep -q "$old_secret" "$SECRETS_FILE"; then
                                echo "Text matches successfully"
                                read -p "Enter the new secret: " new_secret
                                sed -i "s/$old_secret/$new_secret/" "$SECRETS_FILE"
                                echo "Secret has been successfully updated"
                        else

                                echo "No match found."
                        fi
                        ;;
		3)
			# Prompt user to enter log message and create Timestamp.
                        read -p "Enter log message: " log
                        timestamp=$(date "+%Y-%m-%d %H:%M:%S")
                        echo "[$timestamp] $log" >> "$LOGS_FILE"
                        echo "Log added."
                        ;;
                4)
			# Deny access to Keys. 
                        echo "ACCESS DENIED 🚫 "
                        ;;
                5)
			# Exit.
                        echo "Exiting"
                        exit 0
                        ;;
                *)echo
		       # Declare Invalid choice if choice differs from 1,2,3,4,or 5.
			"Invalid choice"
                        ;;
        esac
done


