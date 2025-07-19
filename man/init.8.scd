INIT(8)


# NAME

*init* - initiate the system


# SYNOPSIS

/sbin/init


# DESCRIPTION

The *init* script sets up your computer for use.

It does the following:
. Sets basic TERM and PATH variables
. Quiets dmesg console display
. Displays a banner
. Mounts pseudo file systems
. Creates fd and stdio links
. Checks file systems
. Remounts rootfs as read-write
. Mounts all local filesystems
. Sets the hostname from /etc/hostname
. Displays boot time
. Starts services defined in /etc/sin/sv/DEFAULT
. Sleeps forever (I wish)


# SEE ALSO

_run_(1)


# AUTHORS

Created and maintained by Tox <toxtek@proton.me>. Upstream is located at
https://github.com/Toxikuu/sin.
