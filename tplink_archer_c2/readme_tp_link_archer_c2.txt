dirty solution to get VLAN to work in TP-Link Archer C2

It is a workaround for the following bug:
https://bugs.openwrt.org/index.php?do=details&task_id=3879

Just upload this config to Archer C2 and go from there.

Modifications include removal of switch0 config in /etc/config/network
(credits to cybermaus)
and modified /etc/init.d/network to disable vlan switching on switch0
so RGMII goes to switch1 

Also my openwrt fnord to reinstall openwrt packages after sysupgrade
is included.

Have fun with this cheap router.

BTW: If something strange happens to your browser which ends in high 
disk activity and a slow computer, the Gilb might want to visit you.
Unplug the net, kill your browser. 
Then setup a honeypot, start a sniffer and investigate..


