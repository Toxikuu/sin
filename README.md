# Sin

**Sin is a ~shitty~ ⋆✧ simple₊˚✩ , hackable, portable init**

## Synopsis
Sin provides a simple `init` script, as well as the `shutdown` and `reboot`
utilities as symlinks to `halt`.

It also provides `run`, a basic service manager. This service manager supports
starting, stopping, and restarting services. The services are defined in
`/etc/sin/sv/`. Each service contains at least two functions:
1. `start`   -> the commands to start a service
2. `stop`    -> the commands to stop a service
3. `restart` -> the commands to restart a service, defaulting to `stop && start`
   if undefined.

The services enabled at boot are defined in `/etc/sin/sv/DEFAULT`.

For more information about running services, run `run -h` and `man run`.

For more information about writing services, run `man sv` and peruse the
predefined services.

## Installation
**Don't** install this on a system that already has an `init`. This is made for
LFS, but should work anywhere. Sin is extremely simple, but you should still
know what you're doing.

Peruse the ~40 line Makefile to see how to install sin and what variables it
supports.

## Advice
I'd highly recommend playing around with the default services and writing your
own. The defaults serve as reference implementations.

## Credits
Thank you to:
- [KISS's init](https://github.com/kisslinux/init)
- [Nyght's Ninit](https://git.disroot.org/nyght/ninit)
