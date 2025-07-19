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
		install -vDm644 target/$$m -t $(DESTDIR)$(MAN)/man$$sect/; \
	done
	
	ln -sf halt.8 $(DESTDIR)$(MAN)/man8/reboot.8
	ln -sf halt.8 $(DESTDIR)$(MAN)/man8/shutdown.8

build: build-man pause add-version

target:
	mkdir -p target

build-man: target
	@for m in man/*.scd; do     \
		m=$${m##*/};            \
		out=target/$${m%.scd};  \
		$(SCDOC) < man/$$m > $$out; \
	done

pause: target
	$(ASM) -f bin -o target/pause src/pause.asm

add-version: target
	@for s in $(shell find src -type f ! -name '*.asm' -exec basename {} \;); do \
		sed 's,|VERSION|,$(VERSION),g' src/$$s > target/$$s; \
	done

clean:
	rm -rf target

.PHONY: all install install-man build-man build clean
