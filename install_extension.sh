#!/bin/bash

# Check if the extension ZIP file exists
if [ ! -f "adblocker.zip" ]; then
  echo "Extension ZIP file 'adblocker.zip' not found. Please build the extension first."
  exit 1
fi

# Function to install the extension on Windows
install_extension_windows() {
  FIREFOX_PROFILES_DIR="$APPDATA/Mozilla/Firefox/Profiles"
  PROFILE_DIR=$(ls -dt "$FIREFOX_PROFILES_DIR"/*/ | head -n 1)
  EXTENSIONS_DIR="$PROFILE_DIR/extensions"

  mkdir -p "$EXTENSIONS_DIR"
  unzip -o adblocker.zip -d "$EXTENSIONS_DIR"
  echo "Extension installed successfully in the current Firefox profile on Windows."
}

# Function to install the extension on macOS
install_extension_macos() {
  FIREFOX_PROFILES_DIR="$HOME/Library/Application Support/Firefox/Profiles"
  PROFILE_DIR=$(ls -dt "$FIREFOX_PROFILES_DIR"/*/ | head -n 1)
  EXTENSIONS_DIR="$PROFILE_DIR/extensions"

  mkdir -p "$EXTENSIONS_DIR"
  unzip -o adblocker.zip -d "$EXTENSIONS_DIR"
  echo "Extension installed successfully in the current Firefox profile on macOS."
}

# Function to install the extension on Linux (user-level)
install_extension_linux_user() {
  FIREFOX_PROFILES_DIR="$HOME/.mozilla/firefox"
  PROFILE_DIR=$(ls -dt "$FIREFOX_PROFILES_DIR"/*/ | head -n 1)
  EXTENSIONS_DIR="$PROFILE_DIR/extensions"

  mkdir -p "$EXTENSIONS_DIR"
  unzip -o adblocker.zip -d "$EXTENSIONS_DIR"
  echo "Extension installed successfully in the current Firefox profile on Linux."
}

# Function to install the extension on Linux (system-level)
install_extension_linux_system() {
  FIREFOX_SYSTEM_DIR="/usr/lib/firefox-addons/extensions"
  FIREFOX_PROFILES_DIR="/etc/firefox/profile"
  PROFILE_DIR=$(ls -dt "$FIREFOX_PROFILES_DIR"/*/ | head -n 1)
  EXTENSIONS_DIR="$PROFILE_DIR/extensions"

  # Check if the system-level profile directory exists
  if [ -z "$PROFILE_DIR" ]; then
    echo "System-level Firefox profile directory not found. Please install the extension manually or use the user-level installation."
    exit 1
  fi

  sudo mkdir -p "$EXTENSIONS_DIR"
  sudo unzip -o adblocker.zip -d "$EXTENSIONS_DIR"
  echo "Extension installed successfully in the system-level Firefox profile on Linux."
}

# Check the current operating system
case "$(uname -s)" in
  CYGWIN*|MINGW*|MSYS*)
    install_extension_windows
    ;;
  Darwin*)
    install_extension_macos
    ;;
  Linux*)
    # Prompt the user to choose the installation level
    echo "Choose the installation level:"
    echo "1. User-level (requires user permissions)"
    echo "2. System-level (requires sudo access)"
    read -p "Enter the number corresponding to your choice: " INSTALL_LEVEL

    case $INSTALL_LEVEL in
      1)
        install_extension_linux_user
        ;;
      2)
        install_extension_linux_system
        ;;
      *)
        echo "Invalid choice. Installation canceled."
        exit 1
        ;;
    esac
    ;;
  *)
    echo "Unsupported operating system. Please install the extension manually."
    exit 1
    ;;
esac
