PREFIX  := /usr
SBIN    := $(PREFIX)/sbin
BIN     := $(PREFIX)/bin
MAN     := $(PREFIX)/share/man

install:
	install -vm755      $(DESTDIR)/etc/sin
	install -vm644 lib  $(DESTDIR)/etc/sin
	cp      -dr    sv   $(DESTDIR)/etc/sin

	install -vm755 init $(DESTDIR)$(SBIN)/init

	install -vm755 halt $(DESTDIR)$(SBIN)/halt
	ln      -sf    halt $(DESTDIR)$(SBIN)/reboot
	ln      -sf    halt $(DESTDIR)$(SBIN)/shutdown

	install -vm755 run  $(DESTDIR)$(BIN)/run

.PHONY: install
