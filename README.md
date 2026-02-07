CyberSec Ops: The Secure Vault Challenge
You are part of a junior cybersecurity team. Your mission: build a Secure Vault System in Linux that can safely store secrets, control file access, allow secure updates, and monitor security risks.

This project has 4 steps. Each step builds on the last, and you will submit all scripts at the end.

Step 1: Vault Setup (vault_setup.sh)
Requirements:

Create a directory called secure_vault in the user’s home.

Inside it, create 3 files:

keys.txt → stores encryption keys
secrets.txt → stores confidential data
logs.txt → stores system logs
Add a welcome message to each file using I/O redirection.

Print a success message and list all files in long format (ls -l).

Step 2: Vault Permissions (vault_permissions.sh)
Requirements:

Check if secure_vault exists → if not, print an error and exit.

For each file (keys.txt, secrets.txt, logs.txt):

Display the current permission using ls -l.
Ask the user if they want to update the permission.
If yes, prompt for new permission (e.g., 600).
If no, leave it as is.
If the user presses Enter without input → apply default permissions:
keys.txt → 600
secrets.txt → 640
logs.txt → 644
Use a function to handle permission updates.

At the end, display all file permissions.

Step 3: Vault Operations (vault_ops.sh)
Requirements:
Create a menu-driven program that runs in a loop until exit.

Menu Options:

Add Secret → Append a new secret to secrets.txt.

Update Secret → Replace an existing secret using sed -i.
If no match found, display "No match found."
Add Log Entry → Add a timestamped log into logs.txt.

Access Keys → Always print "ACCESS DENIED 🚫" (never show keys.txt).

Exit

Hints: Use while true, case, sed, date, and I/O redirection.

Step 4: Vault Monitoring (vault_monitor.sh)
Requirements:

For each file in secure_vault, display:

File name
Size in bytes
Last modified date
Current permissions
If any file has permissions more open than 644, print:
"⚠️ SECURITY RISK DETECTED"

Save all results into vault_report.txt inside secure_vault.

Print confirmation that the report has been created.

Submission Details
Your submission should be a GitHub repository link
The files inside the repository should be:
vault_setup.sh
vault_permissions.sh
vault_ops.sh
vault_monitor.sh
vault_report.txt (generated after running Step 4)
 


