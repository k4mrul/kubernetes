
#### Let's create a LXC profile for k8s cluster

```
$ lxc profile create k8s
$ cat k8s-profile-config | lxc profile edit k8s

```

#### Create node for k8s cluster
```
$ lxc launch images:centos/7 kmaster --profile k8s
Creating kmaster
Starting kmaster

$ launch images:centos/7 kworker1 --profile k8s
Creating kworker1
Starting kworker1

$ lxc launch images:centos/7 kworker2 --profile k8s
Creating kworker2
Starting kworker2
```

> **Note:**  The naming convention for k8s master node name has to have  **master**  keyword in the name and for k8s worker nodes  **worker**  keyword in the name.

```
$ lxc list
+-----------+---------+-----------------------+----------------------------------------------+------------+-----------+
|   NAME    |  STATE  |         IPV4          |                     IPV6                     |    TYPE    | SNAPSHOTS |
+-----------+---------+-----------------------+----------------------------------------------+------------+-----------+
| kmaster   | RUNNING | 10.116.220.25 (eth0) | fd42:6c9f:e8c6:b016:216:3eff:fee4:8c76 (eth0) | PERSISTENT | 0         |
+-----------+---------+-----------------------+----------------------------------------------+------------+-----------+
| kworker1  | RUNNING | 10.116.220.19 (eth0)  | fd42:6c9f:e8c6:b016:216:3eff:fee8:8bc2 (eth0) | PERSISTENT | 0         |
+-----------+---------+-----------------------+----------------------------------------------+------------+-----------+
| kworker2  | RUNNING | 10.116.220.29 (eth0) | fd42:6c9f:e8c6:b016:f0c0:87ff:fe93:9b74 (eth0) | PERSISTENT | 0         |
+-----------+---------+-----------------------+----------------------------------------------+------------+-----------+

```

#### Run the following commands one by one (orders matter!)
```
$ cat bootstrap-kube.sh | lxc exec kmaster bash
$ cat bootstrap-kube.sh | lxc exec kworker1 bash
$ cat bootstrap-kube.sh | lxc exec kworker2 bash
```

#### Verify

##### Exec into kmaster node

```
$ lxc exec kmaster bash

```

#### Verifying Nodes

```
$ kubectl get nodes
NAME        STATUS   ROLES    AGE     VERSION
kmaster     Ready    master   8m53s   v1.19.2
kworker1   Ready    <none>   5m35s   v1.19.2
kworker2   Ready    <none>   3m39s   v1.19.2

```
Credit: https://github.com/justmeandopensource/kubernetes
