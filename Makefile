PREFIX  := /usr
SBIN    := $(PREFIX)/sbin
BIN     := $(PREFIX)/bin
MAN     := $(PREFIX)/share/man

install:
	install -vDm644 lib  $(DESTDIR)/etc/sin/lib
	cp      -af     sv   $(DESTDIR)/etc/sin/

	install -vDm755 init $(DESTDIR)$(SBIN)/init

	install -vDm755 halt $(DESTDIR)$(SBIN)/halt
	ln      -sf     halt $(DESTDIR)$(SBIN)/reboot
	ln      -sf     halt $(DESTDIR)$(SBIN)/shutdown

	install -vDm755 run  $(DESTDIR)$(BIN)/run

.PHONY: install
