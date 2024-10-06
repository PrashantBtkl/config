#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Generate apt package installation commands
generate_apt_commands() {
    if command_exists apt; then
        echo "# APT Packages"
        apt list --installed | grep -v "Listing..." | cut -d'/' -f1 | xargs -I {} echo "sudo apt install -y {}"
    fi
}

# Generate snap package installation commands
generate_snap_commands() {
    if command_exists snap; then
        echo "# Snap Packages"
        snap list | tail -n +2 | awk '{print $1}' | xargs -I {} echo "sudo snap install {}"
    fi
}

output_file="package_install_commands.sh"

# Main script
{
    echo "#!/bin/bash"
    echo
    generate_apt_commands
    echo
    generate_snap_commands
} > "$output_file"

# Make the output file executable
chmod +x "$output_file"

echo "Package installation commands have been saved to $output_file"
