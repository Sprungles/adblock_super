# Firefox Adblocker Extension

This Firefox extension allows you to block ads and improve your browsing experience. It utilizes the popular ad-blocking list from The Quantum Ad List.

## Installation

1. Clone or download this repository to your local machine.
2. Build the extension by running the build script. Make sure you have Node.js and npm installed.

   ```shell
   npm install
   npm run build

    After the build process completes, you will find the extension ZIP file named adblocker.zip.
    Follow the instructions below based on your operating system.

Windows

    Make sure you have Firefox installed on your Windows machine.
    Locate your Firefox profile directory. The default directory is usually located at %APPDATA%/Mozilla/Firefox/Profiles/.
    Inside your profile directory, navigate to the extensions folder.
    Copy the adblocker.zip file to the extensions folder.
    Restart Firefox.
    The adblocker extension should be installed and active.

macOS

    Ensure that Firefox is installed on your macOS machine.
    Locate your Firefox profile directory. The default directory is usually located at ~/Library/Application Support/Firefox/Profiles/.
    Inside your profile directory, navigate to the extensions folder.
    Copy the adblocker.zip file to the extensions folder.
    Restart Firefox.
    The adblocker extension should be installed and active.

Linux

    Verify that you have Firefox installed on your Linux machine.

    Choose the appropriate installation level:
        User-level installation: If you have user permissions to modify your Firefox profile.
        System-level installation: If you have sudo access and want to install the extension globally.

    Open a terminal and navigate to the project directory.

    Run the installation script:

    shell

    bash install_extension.sh

    Follow the prompts to select the installation level and provide necessary permissions.

    Restart Firefox.

    The adblocker extension should be installed and active.

Usage

Once the extension is installed, it will automatically block ads based on the ad-blocking list provided by The Quantum Ad List. Simply browse the web as usual, and the extension will take care of blocking unwanted ads.

If you encounter any issues or have any questions, please feel free to create an issue in this repository.
License

This project is licensed under the GNU General Public License v2.0.
