RUN(1)


# NAME

*run* - manage sin services


# SYNOPSIS

*run* -s service


# DESCRIPTION

The *run* script starts, stops, or restarts a service, as defined in
/etc/sin/sv.

It works by sourcing the service script and executing the relevant function.

Services defined in /etc/sin/sv/DEFAULT are run on boot.


# SEE ALSO

_sv_(5) _init_(8)


# AUTHORS

Created and maintained by Tox <toxtek@proton.me>. Upstream is located at
https://github.com/Toxikuu/sin.
