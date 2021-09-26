## PXEfiles to be installed in ftpd server directory of dnsmasq-full for OpenWRT

### Purpose
This 

### Dependencies
dnsmasq-full or other dnsmasq with tftpd support. It should work on a base OpenWRT system with installed dnsmasq-full

### Usage
1. look for a nice location to store these files on your router: e.g. usbstick or ubimount on Netgear R6220
2. configure the location with luci so the tftpd server will serve it on any client trying to boot tftp
3. extract the archive to that location: tar -xvzf tftpd.tgz /location

This will only hold the basic tools for booting images and displaying the menues.
You will need to write the menue entries according to your setup.
If you have the Netgear R6220 or something similar with enough local storage, just keep these basic files
in your router and have the linux, openBSD and other stuff you want to boot on a usb stick or disk.
This eases deployment and also demonstrates without external storage that your tftp stuff is working, some
basic tests you can also execute with diskless systems to see if they are basically functional.


### Notes
Tested on:
- Netgear R6220 running OpenWRT 21.02.0

### License
WTFPL


