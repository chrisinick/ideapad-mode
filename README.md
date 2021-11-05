# ideapad_mode
**Control the battery and cooling of the Lenovo Ideapad 5 on Linux**

## Features
- set cooling modes: intelligent, extreme performance, battery saving
- enable/disable rapid charge
- enable/disable battery conservation

## Installation

### 1. Dependency
Use your package manager to install acpi_call (or acpi_call-lts for LTS kernel, acpi_call-dkms for other kernels).

Type 'uname -r' to find out which kernel you are using.
### 2. Clone and Copy Script
```bash
git clone --depth=1 https://github.com/chrisinick/ideapad_mode.git
sudo cp ideapad_mode/ideapadmode /usr/local/bin
```
You can delete the script by typing 'sudo rm /usr/local/bin/ideapadmode'.

## Usage
### Show Current Status
```bash
sudo ideapadmode status
```
### Set Cooling Mode
```bash
sudo ideapadmode cooling intelligent|extreme|battery
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
Licensed under the [MIT](https://github.com/chrisinick/IdeapadMode/LICENSE.md) License.
