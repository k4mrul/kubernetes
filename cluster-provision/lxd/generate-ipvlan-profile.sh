#!/bin/sh


# if [[ $# -eq 0 ]] ; then
#     echo "Need to provide argument"
# fi


DEFAULT_INTERFACE=$(ip r | grep default | awk '/default/ {print $5}')
CNT="$1"
cat << EOF > ipvlan-192.168.1.20${CNT}
config:
  user.network-config: |
    #cloud-config
    version: 2
    ethernets:
      eth0:
        addresses:
          - 192.168.1.20${CNT}/32
        dhcp4: no
        dhcp6: no
        nameservers:
          addresses: [8.8.8.8, 1.1.1.1]
        routes:
         - to: 0.0.0.0/0
           via: 169.254.0.1
           on-link: true
description: "ipvlan LXD profile"
devices:
  eth0:
    ipv4.address: 192.168.1.20${CNT}
    nictype: ipvlan
    parent: ${DEFAULT_INTERFACE}
    type: nic
name: ipvlan
used_by:
EOF