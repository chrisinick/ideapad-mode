#!/usr/bin/env bash

performance_status () {
	echo '\_SB.PCI0.LPC0.EC0.STMD' >/proc/acpi/call
	if [[ $(tr -d '\0' < /proc/acpi/call) = "0x1" ]]; then
		echo "performance: intelligent"
	else
		echo '\_SB.PCI0.LPC0.EC0.QTMD' >/proc/acpi/call
		if [[ $(tr -d '\0' < /proc/acpi/call) = "0x1" ]]; then
			echo "performance: battery saving"
		else
			echo "performance: extreme"
		fi
	fi
}

performance_intelligent () {
    echo '\_SB.PCI0.LPC0.EC0.VPC0.DYTC 0x000FB001' >/proc/acpi/call
}

performance_extreme () {
    echo '\_SB.PCI0.LPC0.EC0.VPC0.DYTC 0x0012B001' >/proc/acpi/call
}

performance_battery () {
    echo '\_SB.PCI0.LPC0.EC0.VPC0.DYTC 0x0013B001' >/proc/acpi/call
}

rapidcharge_status () {
	echo '\_SB.PCI0.LPC0.EC0.FCGM' >/proc/acpi/call
	if [[ $(tr -d '\0' < /proc/acpi/call) = "0x1" ]]; then
		echo "rapid charge: on"
	else
		echo "rapid charge: off"
	fi
}

rapidcharge_on () {
    echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x07' >/proc/acpi/call
}

rapidcharge_off () {
    echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x08' >/proc/acpi/call
}

batterycon_status () {
	echo '\_SB.PCI0.LPC0.EC0.BTSG' >/proc/acpi/call
	if [[ $(tr -d '\0' < /proc/acpi/call) = "0x1" ]]; then
		echo "battery conservation: on"
	else
		echo "battery conservation: off"
	fi
}

batterycon_on () {
    echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x03' >/proc/acpi/call
}

batterycon_off () {
    echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x05' >/proc/acpi/call
}

demand_root () {
	if [[ "$EUID" -ne 0 ]]; then
		>&2 echo "ideapadmode: Permission denied. Command must be run as root."
		exit 1
	fi
}

try_modprobe () {
	# check acpi_call dependency
	if [[ $(modprobe acpi_call 2>&1) ]]; then
		>&2 echo "ideapadmode: acpi_call failed. Install acpi_call to run the command (or acpi_call-lts for LTS kernel, acpi_call-dkms for other kernels)."
		exit 1
	fi
}

# print status
if [[ "$1" = "status" ]]; then

	demand_root
	try_modprobe

	performance_status
	rapidcharge_status
	batterycon_status

# set performance mode
elif [[ "$1" = "performance" ]]; then

	demand_root
	try_modprobe

	if [[ "$2" = "intelligent" ]]; then
	    performance_intelligent
	elif [[ "$2" = "extreme" ]]; then
	    performance_extreme
	elif [[ "$2" = "battery" ]]; then
	    performance_battery
	else
		>&2 echo "Not a valid performance mode. Available modes are 'intelligent', 'extreme' and 'battery'."
		exit 1
	fi

	echo "Verifying..."
	sleep 0.125
	performance_status

# set rapid charge
elif [[ "$1" = "rapidcharge" ]]; then

	demand_root
	try_modprobe

	if [[ "$2" = "on" ]]; then
	    rapidcharge_on
		batterycon_off
	elif [[ "$2" = "off" ]]; then
	    rapidcharge_off
	else
		>&2 echo "No valid input. Rapid charge can be either 'on' or 'off'."
		exit 1
	fi

	echo "Verifying..."
	sleep 0.125
	rapidcharge_status
	batterycon_status

# set battery conservation
elif [[ "$1" = "batterycon" ]]; then

	demand_root
	try_modprobe

	if [[ "$2" = "on" ]]; then
	    batterycon_on
		rapidcharge_off
	elif [[ "$2" = "off" ]]; then
	    batterycon_off
	else
		>&2 echo "No valid input. Battery conservation can be either 'on' or 'off'."
		exit 1
	fi

	echo "Verifying..."
	sleep 0.125
	rapidcharge_status
	batterycon_status

# documentation
else

	printf "ideapadmode\n\nUsage: sudo ./ideapadmode.sh status\n       sudo ./ideapadmode.sh performance intelligent|extreme|battery\n       sudo ./ideapadmode.sh rapidcharge|batterycon on|off\n\nSource code: https://github.com/chrisinick/ideapad-mode\n"

fi
