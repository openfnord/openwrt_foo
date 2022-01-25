#!/bin/sh

install_time=$(opkg status kernel | grep Installed-Time | sed "s/Installed-Time: //")

opkg list-installed | awk -F " " '{print $1}' > /tmp/installed_pkg

while read index
do
	    loop_inst_time=$(opkg status $index | grep Installed-Time | sed "s/Installed-Time: //")
	        is_user_installed=$(opkg status $index | grep "Status:" | grep "user")
		    if [ "$loop_inst_time" -ne "$install_time" ] && [ -n "$is_user_installed" ]; then
			            echo $index
				        fi
				done < /tmp/installed_pkg


