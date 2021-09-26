#!/bin/sh /etc/rc.common

START=10
STOP=98


boot() {

        insmod mtd-rw i_want_a_brick=1
        ubiattach -p /dev/mtd5
        mkdir /tmp/ubi1
        mount -t ubifs /dev/ubi1_0 /tmp/ubi1

}
## WAN MAC address randomizer for OpenWRT

### Purpose
This script mounts the unused storage /dev/mtd5 on a netgear r6220 to /tmp/ubi1 
It is implemented as an [init script](https://wiki.openwrt.org/doc/techref/initscripts), so it is able 
to mount the storage on every boot

### Dependencies
kmod-mtd-rw, ubiattach. The packages are installable on an OpenWRT system.

### Usage
1. Copy `ubimount` to `/etc/init.d/`
2. Make sure the file is executable (`chmod +x /etc/init.d/ubimount`)
3. Modify the `START` line in the file if you'd like to customize the init order (optional)
4. Enable the service so it will mount on every boot (`/etc/init.d/ubimount enable`)
5. Restart your router or start the service manually (`/etc/init.d/ubimount start`)


This is to use the additional storage as a root for tftpd and to back-up adblock and ban-ip files /lists


/etc/init.d/dhcpupdate does this on every reboot:

        insmod mtd-rw i_want_a_brick=1
        ubiattach -p /dev/mtd5
        mkdir /tmp/ubi1
        mount -t ubifs /dev/ubi1_0 /tmp/ubi1



### Notes
Tested on:
- Netgear R6220 running OpenWRT 21.02.0

### License
WTFPL


