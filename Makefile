PREFIX ?= /usr

all:

build: clean
	bash build.sh

clean:
	-rm -rf build/

install:
	mkdir -p $(DESTDIR)$(PREFIX)/share/claws-mail/themes
	cp -R \
		Papirus \
		Papirus-Adapta \
		Papirus-Adapta-Nokto \
		ePapirus \
		Papirus-Dark \
		Papirus-Light \
		$(DESTDIR)$(PREFIX)/share/claws-mail/themes

uninstall:
	-rm -rf $(DESTDIR)$(PREFIX)/share/claws-mail/themes/Papirus
	-rm -rf $(DESTDIR)$(PREFIX)/share/claws-mail/themes/Papirus-Adapta
	-rm -rf $(DESTDIR)$(PREFIX)/share/claws-mail/themes/Papirus-Adapta-Nokto
	-rm -rf $(DESTDIR)$(PREFIX)/share/claws-mail/themes/ePapirus
	-rm -rf $(DESTDIR)$(PREFIX)/share/claws-mail/themes/Papirus-Dark
	-rm -rf $(DESTDIR)$(PREFIX)/share/claws-mail/themes/Papirus-Light

_get_version:
	$(eval VERSION := $(shell git show -s --format=%cd --date=format:%Y%m%d HEAD))
	@echo $(VERSION)

release: _get_version
	git tag -f $(VERSION)
	git push origin --tags
	git push origin

undo_release: _get_version
	-git tag -d $(VERSION)
	-git push --delete origin $(VERSION)


.PHONY: all build clean install uninstall _get_version release undo_release
