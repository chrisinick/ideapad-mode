# ideapad_mode

**Control the battery and cooling of the Lenovo Ideapad 5 on Linux**

## Features

- set cooling modes: intelligent, extreme performance, battery saving
- enable/disable rapid charge
- enable/disable battery conservation

## Installation

### 1. Dependencies

- bash
- acpi_call (or acpi_call-lts for LTS kernel, acpi_call-dkms for other kernels).

Type 'uname -r' to find out which kernel you are using.

### 2. Download and Installation

```bash
git clone --depth=1 https://github.com/chrisinick/ideapad_mode.git
cd ideapad_mode
chmod u+x ideapadmode
```

Optionally, add ideapadmode to PATH to use it from anywhere in the shell.

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

Licensed under the [MIT](https://github.com/chrisinick/ideapad_mode/blob/master/LICENSE) License.

