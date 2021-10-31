# Kubernetes cluster provision in LXC (Linux only)
Originally forked from https://github.com/justmeandopensource/kubernetes/ and tweaked/fixed below changes

- weave network plugin instead of flannel for network policy intensive workloads
- fixed /dev/kmsg issue in lxc container

# Network: ipvlan

This setup will create ipvlan, you can ping your lxc containers from LAN. IP block will start from
192.168.1.201

Note. You can't ping the lxc container from your host machine. However, you can ping it within the network

Source: https://blog.simos.info/how-to-get-lxd-containers-obtain-ip-from-the-lan-with-ipvlan-networking/

# Provisioning Cluster
Make sure you can launch a container without an issue

`lxc launch ubuntu:20.04 test`


`lxc list`
|NAME|STATE|IPV4|IPV6|TYPE|SNAPSHOTS|
|----|----|----|----|----|----|
|test|RUNNING|10.179.77.94 (eth0)||CONTAINER|0|


If lxc container state is running and IPV4 address assigned you are good to go.


Now clone this repo and run provision script
```
chmod +x kubelex
```

```
./kubelex provision
```

# Destroying cluster
```
./kubelex destroy
```

# Stopping running cluster
```
./kubelex stop
```

# Starting stopped cluster
```
./kubelex start
```
