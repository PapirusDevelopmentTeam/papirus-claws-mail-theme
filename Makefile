all:

install:
	mkdir -p $(DESTDIR)/usr/share/claws-mail/themes
	cp --no-preserve=mode,ownership -r \
		Papirus \
		ePapirus \
		Papirus-Dark \
		Papirus-Light \
		$(DESTDIR)/usr/share/claws-mail/themes

uninstall:
	-rm -rf $(DESTDIR)/usr/share/claws-mail/themes/Papirus
	-rm -rf $(DESTDIR)/usr/share/claws-mail/themes/ePapirus
	-rm -rf $(DESTDIR)/usr/share/claws-mail/themes/Papirus-Dark
	-rm -rf $(DESTDIR)/usr/share/claws-mail/themes/Papirus-Light

_get_version:
	$(eval VERSION := $(shell git show -s --format=%cd --date=format:%Y%m%d HEAD))
	@echo $(VERSION)

push:
	git push origin

release: _get_version push
	git tag -f $(VERSION)
	git push origin --tags

undo_release: _get_version
	-git tag -d $(VERSION)
	-git push --delete origin $(VERSION)


.PHONY: all install uninstall _get_version push release undo_release
