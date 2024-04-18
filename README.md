# Audio Loopback
### v1.0.0
`systemd` service which manages the start and stop of audio loopback devices. Listen to your primary, active audio device's Line-in.

Bind audio input(s) to first parsed active output. If no active output is found, bind to first inactive output.

**[Latest release](https://github.com/portellam/audio-loopback/releases/latest) | [View master branch...](https://github.com/portellam/audio-loopback/tree/master)**

## Table of Contents
- [Download](#download)
- [Host Requirements](#host-requirements)
- [Usage](#usage)
  - [`installer.bash`](#installerbash)
- [Contact](#contact)

### Download
- To download this script, you may:
  - Download the ZIP file:
    1. Viewing from the top of the repository's (current) webpage, click the green `<> Code ` drop-down icon.
    2. Click `Download ZIP`. Save this file.
    3. Open the `.zip` file, then extract its contents.

  - Clone the repository:
    1. Open a Command Line Interface (CLI).
      - Open a console emulator (for Debian systems: Konsole).
      - Open a existing console: press `CTRL` + `ALT` + `F2`, `F3`, `F4`, `F5`, or `F6`.
        - **To return to the desktop,** press `CTRL` + `ALT` + `F7`.
        - `F1` is reserved for debug output of the Linux kernel.
        - `F7` is reserved for video output of the desktop environment.
        - `F8` and above are unused.

    2. Change your directory to your home folder or anywhere safe: `cd ~`
    3. Clone the repository: `git clone https://www.github.com/portellam/audio-loopback`

- To make this script executable, you must:
  1. Open the CLI (see above).
  2. Go to the directory of where the cloned/extracted repository folder is: `cd name_of_parent_folder/audio-loopback/`
  3. Make the installer script file executable: `chmod +x installer.bash`
    - Do **not** make any other script files executable. The installer will perform this action.
    - Do **not** make any non-script file executable. This is not necessary and potentially dangerous.

### Host Requirements
- `pulse audio` for audio playback and loopback devices.
- `systemd` for system services.

### Usage
#### `installer.bash`
- From within the project folder, execute: `sudo bash installer.bash`

```
  -i, --install         Install service.
  -u, --uninstall       Uninstall service.
  -h, --help            Print this help and exit.
```

### Contact
Did you encounter a bug? Do you need help? Please contact by [raising an issue](https://github.com/portellam/audio-loopback/issues) with the project itself.