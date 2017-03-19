libvirt
 *   CONFIG_BRIDGE_NF_EBTABLES:  is not set when it should be.
 *   CONFIG_BRIDGE_EBT_MARK_T:   is not set when it should be.
 *   CONFIG_BRIDGE_EBT_T_NAT:    is not set when it should be.


docker
*   CONFIG_MEMCG_KMEM: is optional

*    CONFIG_CGROUP_NET_PRIO:     is not set when it should be.

 *   CONFIG_CGROUPS:     is not set when it should be.
 *   CONFIG_CGROUP_CPUACCT:      is not set when it should be.
 *   CONFIG_CGROUP_DEVICE:       is not set when it should be.
 *   CONFIG_CGROUP_FREEZER:      is not set when it should be.
 *   CONFIG_CGROUP_SCHED:        is not set when it should be.
 *   CONFIG_CPUSETS:     is not set when it should be.
 *   CONFIG_MEMCG:       is not set when it should be.
 *   CONFIG_MEMCG_KMEM: is optional
 *   CONFIG_MEMCG_SWAP: is required if you wish to limit swap usage of containers
 *   CONFIG_MEMCG_SWAP_ENABLED:  is not set when it should be.
 *   CONFIG_BLK_CGROUP: is optional for container statistics gathering
 *   CONFIG_CGROUP_PERF: is optional for container statistics gathering
 *   CONFIG_CGROUP_HUGETLB:      is not set when it should be.
 *   CONFIG_NET_CLS_CGROUP:      is not set when it should be.
 *   CONFIG_CFS_BANDWIDTH: is optional for container statistics gathering
 *   CONFIG_FAIR_GROUP_SCHED:    is not set when it should be.
 *   CONFIG_RT_GROUP_SCHED:      is not set when it should be.
 *   CONFIG_RESOURCE_COUNTERS: is optional for container statistics gathering
 *   CONFIG_CGROUP_NET_PRIO:     is not set when it should be.
 *   CONFIG_OVERLAY_FS:  is not set when it should be.

 *   CONFIG_USER_NS:     is not set when it should be.
 *   CONFIG_DUMMY:       is not set when it should be.
 *   CONFIG_IP_VS:       is not set when it should be.
 *   CONFIG_IP_VS_PROTO_TCP:     is not set when it should be.
 *   CONFIG_IP_VS_PROTO_UDP:     is not set when it should be.
 *   CONFIG_IP_VS_NFCT:  is not set when it should be.
 *   CONFIG_IPVLAN:      is not set when it should be.


* Messages for package app-emulation/lxc-1.1.5:

 * Could not find a Makefile in the kernel source directory.
 * Please ensure that /usr/src/linux points to a complete set of Linux sources
 * Unable to calculate Linux Kernel version for build, attempting to use running version
 *   CONFIG_USER_NS:     is not set when it should be.
 *   CONFIG_NETLINK_DIAG:  needed for lxc-checkpoint
 *   CONFIG_PACKET_DIAG:  needed for lxc-checkpoint
 *   CONFIG_UNIX_DIAG:  needed for lxc-checkpoint
 *   CONFIG_CHECKPOINT_RESTORE:  needed for lxc-checkpoint

systemd:
 * CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 * Checking for suitable kernel configuration options...
 * CONFIG_FANOTIFY:    is not set when it should be.

If you're running a multicore system you likely should enable CONFIG_PADATA for improved performance and parallel crypto.
* CONFIG_PADATA