#!/bin/bash
# install.sh - Installation script for Time Progressive Rename

set -e

echo "=================================="
echo "Time Progressive Rename - Installer"
echo "=================================="
echo ""

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print colored success messages
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

# Function to print colored warning messages
print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Function to print colored error messages
print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Check that Python is installed
echo "Checking requirements..."
if ! command -v python3 &> /dev/null; then
    print_error "Python 3 is not installed!"
    echo "Install Python with: sudo pacman -S python"
    exit 1
fi

PYTHON_VERSION=$(python3 --version | cut -d' ' -f2)
print_success "Python $PYTHON_VERSION found"

# Ask where to install
echo ""
echo "Choose installation method:"
echo "1) Global installation (requires sudo, available for all users)"
echo "2) User installation (only for you, no sudo needed)"
echo "3) Do not install, use only from current folder"
echo ""
read -p "Choice [1/2/3]: " choice

case $choice in
    1)
        # Global installation
        echo ""
        print_warning "Sudo required for global installation"
        sudo cp timeprogressive-rename /usr/local/bin/
        print_success "Script installed in /usr/local/bin/"
        print_success "You can use it from any folder with: timeprogressive-rename"
        ;;
    2)
        # User installation
        mkdir -p ~/.local/bin
        cp timeprogressive-rename ~/.local/bin/
        print_success "Script installed in ~/.local/bin/"
        
        # Check if ~/.local/bin is in PATH
        if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
            print_warning "~/.local/bin is not in PATH"
            echo ""
            echo "Add this line to your ~/.bashrc or ~/.zshrc:"
            echo 'export PATH="$HOME/.local/bin:$PATH"'
            echo ""
            echo "Do you want me to add it automatically to ~/.bashrc? [y/N]"
            read -p "> " add_path
            if [[ $add_path =~ ^[Yy]$ ]]; then
                echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
                print_success "PATH updated in ~/.bashrc"
                print_warning "Restart the terminal or run: source ~/.bashrc"
            fi
        else
            print_success "You can use it from any folder with: timeprogressive-rename"
        fi
        ;;
    3)
        # No installation
        print_success "Ok, use ./timeprogressive-rename from current folder"
        ;;
    *)
        print_error "Invalid choice"
        exit 1
        ;;
esac

# Make executable in any case
chmod +x timeprogressive-rename
print_success "Script made executable"

echo ""
echo "=================================="
print_success "Installation completed!"
echo "=================================="
echo ""
echo "Next steps:"
echo "  1. Read the documentation in README.md"
echo "  2. Look at the examples in EXAMPLES.md"
echo "  3. Test the script: cd examples/test_files/ && ../../timeprogressive-rename jpg"
echo ""
echo "Have fun! 🚀"