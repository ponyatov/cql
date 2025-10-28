.PHONY : install update ref gz
install: $(WS)_install doc ref gz
	$(MAKE) update
update : $(WS)_update
ref    : $(RF)
gz     : $(GZ)

Debian_install:
# sudo dpkg --add-architecture i386
Debian_update: apt.Debian
	sudo apt update
	sudo apt install -uy `cat $<` $(APT)

Ubuntu_install:
Ubuntu_update: apt.Ubuntu
	sudo apt update
	sudo apt install -uy `cat $<` $(APT)

Msys_install:
	pacman -Suy
Msys_update: apt.Msys
	pacman -S $(shell cat $< | tr '\n' ' ') $(MSYS)
