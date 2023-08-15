# audio-loopback
## About
### Description:
Linux systemd service to start/stop audio loopback device(s). Listen to your primary active audio device's Line-in.

Bind audio input(s) to first parsed active output. If no active output is found, bind to first inactive output. If no output is found, fail.

## How-to
### To download, execute:

        git clone https://github.com/portellam/acpi-sleep

### To execute:

        sudo bash installer.bash

#### Usage:

        Usage: bash installer.bash [OPTION]
        Linux systemd service to start/stop audio loopback device(s).

          -i, --install         Install service.
          -u, --uninstall       Uninstall service.
          -h, --help            Print this help and exit.

## Disclaimer
Please, evaluate your system before installation. Use at your own risk.