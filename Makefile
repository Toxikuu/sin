ASM     := yasm
LD      := ld
SCDOC   := scdoc
PREFIX  := /usr
SBIN    := $(PREFIX)/sbin
BIN     := $(PREFIX)/bin
MAN     := $(PREFIX)/share/man

all: build

install: install-man
	install -vDm644 lib  $(DESTDIR)/etc/sin/lib
	cp      -af     sv   $(DESTDIR)/etc/sin/

	install -vDm755 init $(DESTDIR)$(SBIN)/init

	install -vDm755 halt $(DESTDIR)$(SBIN)/halt
	ln      -sf     halt $(DESTDIR)$(SBIN)/reboot
	ln      -sf     halt $(DESTDIR)$(SBIN)/shutdown

	install -vDm755 run  $(DESTDIR)$(BIN)/run

install-man:
	@for m in man/*.[1-8]; do   \
		m=$${m##*/};            \
		sect=$${m##*.};         \
		install -vDm644 man/$$m -t $(DESTDIR)$(MAN)/man$$sect/; \
	done

build: build-man
	$(ASM) -f elf64 -o pause.o pause.asm
	$(LD)  -o pause    pause.o

build-man:
	@for m in man/*.scd; do     \
		out=$${m%.scd};         \
		$(SCDOC) < $$m > $$out; \
	done

clean:
	rm -f man/*.[1-8]

.PHONY: all install install-man build-man clean
