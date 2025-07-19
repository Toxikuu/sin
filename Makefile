ASM     ?= nasm
SCDOC   ?= scdoc
PREFIX  ?= /usr
SBIN    = $(PREFIX)/sbin
BIN     = $(PREFIX)/bin
MAN     = $(PREFIX)/share/man

VERSION ?= 0.1.0

all: build

install: install-man
	install -Dm644  target/lib   $(DESTDIR)/etc/sin/lib
	cp      -af     sv           $(DESTDIR)/etc/sin/

	install -Dm755  target/init  $(DESTDIR)$(SBIN)/init

	install -Dm755  target/halt  $(DESTDIR)$(SBIN)/halt
	ln      -sf     halt         $(DESTDIR)$(SBIN)/reboot
	ln      -sf     halt         $(DESTDIR)$(SBIN)/shutdown

	install -Dm755  target/pause $(DESTDIR)$(BIN)/pause
	install -Dm755  target/run   $(DESTDIR)$(BIN)/run

install-man:
	@for m in man/*.[1-8]; do   \
		m=$${m##*/};            \
		sect=$${m##*.};         \
		install -vDm644 man/$$m -t $(DESTDIR)$(MAN)/man$$sect/; \
	done

build: build-man pause

build-man:
	@for m in man/*.scd; do     \
		out=$${m%.scd};         \
		$(SCDOC) < $$m > $$out; \
	done

pause:
	$(ASM) -f bin -o target/pause src/pause.asm

add-version:
	sed 's,|VERSION|,$(VERSION),g' -i src/*

clean:
	rm -f  man/*.[1-8]
	rm -rf target

.PHONY: all install install-man build-man build clean
