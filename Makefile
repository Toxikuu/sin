ASM     := nasm
SCDOC   := scdoc
PREFIX  := /usr
SBIN    := $(PREFIX)/sbin
BIN     := $(PREFIX)/bin
MAN     := $(PREFIX)/share/man

all: build

install: install-man
	install -Dm644  lib   $(DESTDIR)/etc/sin/lib
	cp      -af     sv    $(DESTDIR)/etc/sin/

	install -Dm755 init  $(DESTDIR)$(SBIN)/init

	install -Dm755  halt  $(DESTDIR)$(SBIN)/halt
	ln      -sf     halt  $(DESTDIR)$(SBIN)/reboot
	ln      -sf     halt  $(DESTDIR)$(SBIN)/shutdown

	install -Dm755  pause $(DESTDIR)$(BIN)/pause
	install -Dm755  run   $(DESTDIR)$(BIN)/run

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
	$(ASM) -f bin -o pause pause.asm
	chmod +x pause

clean:
	rm -f man/*.[1-8]
	rm -f pause

.PHONY: all install install-man build-man build clean
