# ideapadmode

**Control the battery and system performance mode of the Lenovo IdeaPad 5 14are05 on Linux**

## Features

- Set system performance modes: intelligent, extreme, battery saving
- Enable/disable rapid charge
- Enable/disable battery conservation

## Installation

### 1. Dependencies

- bash
- acpi_call (or acpi_call-lts for LTS kernel, acpi_call-dkms for other kernels)

Type `uname -r` to find out which kernel you are using.

### 2. Download

```bash
git clone --depth=1 https://github.com/chrisinick/ideapad-mode.git
cd ideapad-mode
chmod u+x ideapadmode
```

Optionally, add ideapadmode to PATH to use it from anywhere in the shell.

## Usage

### Show Current Status

```bash
sudo ideapadmode status
```
### Set System Performance Mode

```bash
sudo ideapadmode performance intelligent|extreme|battery
```

### Enable/Disable Rapid Charge

```bash
sudo ideapadmode rapidcharge on|off
```

### Enable/Disable Battery Conservation

```bash
sudo ideapadmode batterycon on|off
```
## Resource

[ArchWiki Lenovo IdeaPad 5 14are05](https://wiki.archlinux.org/title/Lenovo_IdeaPad_5_14are05)

## License

Licensed under the [GPLv3](https://github.com/chrisinick/ideapad-mode/blob/master/LICENSE.txt) License.
