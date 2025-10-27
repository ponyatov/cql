.PHONY: all run
all: bin/$(BINFILE) $(S)
	cargo build
run: bin/$(BINFILE) $(S)
	$^
