
PREFIX=/usr
DESTDIR=
PKGNAME="LFSPkg"
PROGRAM=lfspkg
HELPER=finddepends
HELPERCODE=main.cpp
FUNCTIONS=LFSFunctions
MANPAGE=${PROGRAM}.1
RCFILE=lfspkg.rc

clean:
	rm $(HELPER)

install:
	mkdir -vp $(DESTDIR)$(PREFIX)/bin $(DESTDIR)$(PREFIX)/share/$(PKGNAME) $(DESTDIR)/etc $(DESTDIR)$(PREFIX)/share/man/man1||true
	g++ -o $(HELPER) $(HELPERCODE)
	cp $(HELPER) $(PROGRAM) $(DESTDIR)$(PREFIX)/bin
	cp $(MANPAGE) $(DESTDIR)$(PREFIX)/share/man/man1
	cp $(RCFILE) $(DESTDIR)/etc
	cp $(FUNCTIONS) $(DESTDIR)$(PREFIX)/share/$(PKGNAME)

	@echo "*********************************************************"
	@echo "Now set your package options in the file /etc/lfspkg.rc"
	@echo "See the manpage for details, but you should set at least:"
	@echo "OUTPUT and SOURCEARCHIVES"
	@echo "*********************************************************"
