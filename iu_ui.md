## Install all user installed packages with ease after sysupgrade on OpenWRT

### Purpose
These scripts help you to install all the nice packages you instaled by hand after a sysupgrade with new firmware 
without wasting too much time.

### Dependencies
Nothing special. It should work on a base OpenWRT system.

### Usage
If you want to install a new version of openwrt "firmware"
sysupgrade -v openwrt-99.0.23_your_cool_router_v23

you want to install the nice packages you installed by hand using
some script if you have more than one router.


**Before the upgrade**
Before the upgrade go to /etc
cd /etc
./ui.sh >inst.txt
make sure that you have ui.sh, inst.txt and iu.sh in the list
for additional files to be backed up while generating a settings backup
using luci.

also you can just scp /etc/ui.sh, /etc/iu.sh, /etc/inst.txt to your admin computer.

After you have generated your /etc/inst.txt
make sure that at least your /etc/inst.txt gets included into the backup by adding it into the additional files section 
backup your settings with luci: generate-backup.tgz

After upgrading your openwrt
so you did sysupgrade -v /tmp/openwrt_your_cool_router_sysupgrade

go to /etc and look if inst.txt is there and looks good.
if not copy 
scp inst.txt, iu.sh, ui.sh to /etc

ssh to your router

cd /etc
./iu.sh

iu.sh wants to see inst.txt in the directory where it resides, e.g. /etc
iu.sh wants an internet connection to download package lists and packages from official openwrt.


BTW:
iu means "install user stuff"
ui means "user installed"

files: ui.sh, iu.sh, inst.txt



### Notes
Tested on:
- TP-Link TL-WR1043ND 2.0 running OpenWRT 21.0-rc3
- TP-Link TL-WR1043ND 3.0 running OpenWRT 21.0-rc3
- TP-Link Netgear R6220 running OpenWRT 21.0-rc4
upgraded to 21.02.0

### License
WTFPL



