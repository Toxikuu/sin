SV(1)


# NAME

*sv* - definition for a sin service


# SYNOPSIS

*start()   {}* starts a service
*stop()    {}* stops a service
*restart() {}* restarts a service, if defined


# DESCRIPTION

Sin service definitions are defined in /etc/sin/sv. They consist of at minimum a
start and stop function. If custom restart logic is desired, the restart
function may be defined; otherwise, stop and start are called whenever the user
requests a service be restarted.

These functions *must not* hang.

Services defined in /etc/sin/sv/DEFAULT are executed on boot by *init*.


# EXAMPLE

For examples, view the predefined services in the source tree.


# SEE ALSO

_init_(8)


# AUTHORS

Created and maintained by Tox <toxtek@proton.me>. Upstream is located at
https://github.com/Toxikuu/sin.
