# Kubernetes cluster provision in LXC
Originally forked from https://github.com/justmeandopensource/kubernetes/ and tweaked/fixed below changes

- weave network plugin instead of flannel for network policy intensive workloads
- used [nerdctl](https://github.com/containerd/nerdctl) Docker-compatible CLI for managing containerd
- fixed /dev/kmsg issue in lxc container

# Prerequisite
Make sure you can launch a container without an error

`lxc launch ubuntu:20.04 test`


`lxc list`
|NAME|STATE|IPV4|IPV6|TYPE|SNAPSHOTS|
|----|----|----|----|----|----|
|test|RUNNING|10.179.77.94 (eth0)||CONTAINER|0|


If lxc container state is running and IPV4 address assigned, you are good to go.



# Provisioning Cluster
Clone this repo and run provision script
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
