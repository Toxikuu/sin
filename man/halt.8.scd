HALT(8)


# NAME

*halt* - halt the system


# SYNOPSIS

/sbin/shutdown

/sbin/reboot


# DESCRIPTION

The *halt* script either shuts down or reboots your computer depending on
whether it was called from *shutdown* or *reboot*.

Before shutting down, it kills all processes, cleans up /tmp, unmounts
filesystems, remounts root as read only, and syncs filesystems.

The *halt* script takes no arguments.


# INVOCATION

	*shutdown*

	*reboot*


# SEE ALSO

_init_(8)


# AUTHORS

Created and maintained by Tox <toxtek@proton.me>. Upstream is located at
https://github.com/Toxikuu/sin.
