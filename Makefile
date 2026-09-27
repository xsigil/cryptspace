PREFIX ?= $(HOME)/.local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man/man1

BIN = bin/cryptspace
MAN = doc/cryptspace.1

.PHONY: all install uninstall test

all:
	@echo "Run 'make install' to install cryptspace."

install:
	@mkdir -p $(BINDIR) $(MANDIR)
	install -m 755 $(BIN) $(BINDIR)/cryptspace
	install -m 644 $(MAN) $(MANDIR)/cryptspace.1

uninstall:
	rm -f $(BINDIR)/cryptspace
	rm -f $(MANDIR)/cryptspace.1

test:
	@echo "==> Running CLI syntax and help test..."
	bash -n $(BIN)
	./$(BIN) --help > /dev/null
	@echo "[✓] Pass"
