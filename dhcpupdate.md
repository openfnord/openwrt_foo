## DHCP hosts synchronization for distributed dhcp for OpenWRT

### Purpose
This script generates the /etc/config/dhcp an OpenWRT router from 2 files: a settings template and your hosts which can be managed independently.
It is implemented as an [init script](https://wiki.openwrt.org/doc/techref/initscripts), so it is able to update your dhcp settings from a distributed
dhcphosts file every time the router restarts.
This makes sure that a distributed installation of dhcp servers on the same sub net remains in sync. 
Why you want to have a distributed dhcp? 
Because if you loose link to your upstream router or said router fails,
 the rest of the network can still operate (just 2 pcs and a printer for example)

### Dependencies
Nothing special. It should work on a base OpenWRT system.

### Usage
1. Copy `dhcpupdate` to `/etc/init.d/`
2. Make sure the file is executable (`chmod +x /etc/init.d/dhcpupdate`)
3. Modify the `START` line in the file if you'd like to customize the init order (optional)
4. Enable the service so it will randomize the MAC address on every boot (`/etc/init.d/dhcpupdate enable`)
5. Restart your router or start the service manually (`/etc/init.d/dhcpupdate start`)


This is to use a bunch of openwrt routers to build a distributed switch.
If one router fails or a link is lost, the remaining subnet (a pc and 3 printers)
still works as all will get their leases also if they can not see the gateway router
that has normally the dhcp config. This allows for more resiliance of a net.

In order to manage all new hosts more easily one wants to distribute just the dhcphosts file
to all the routers in the subnet. Yes this can be improved but is a simple start to this.


/etc/init.d/dhcpupdate does this on every reboot:

	cat /etc/config/dhcp_basic /etc/config/dhcphosts >/etc/config/dhcp


in dhcp_basic all the general settings of dhcp are configured which may be different for the routers

How to configure it?:
Just configure your router using luci, take the dhcp file copy it to dhcp_basic and to dhcphosts


cd /etc/config
cp /etc/config/dhcp /etc/config/dhcp_basic
cp /etc/config/dhcp /etc/config/dhcphosts


take vi and remove the hosts entries from dhcp_basic

take vi and remove the settings from dhcphosts

now you can configure your hosts in dhcphosts and spread only the dhcphosts file
to all your other openwrt routers in your sub net using scp


### Notes
Tested on:
- TP-Link TL-WR1043ND 2.0 running OpenWRT 21.02.0
- TP-Link TL-WR1043ND 3.0 running OpenWRT 21.02.0

### License
WTFPL


