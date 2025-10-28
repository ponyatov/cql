.PHONY: doc
doc:

.PHONY: doxy
doxy: .doxygen doc/DoxygenLayout.xml doc/logo.png \
				doc/custom.css doc/custom_dark_theme.css
	rm -rf doc/html ; doxygen $< 1>/dev/null


DARK_URL = https://github.com/MaJerle/doxygen-dark-theme/raw/refs/heads/main
doc/custom.css:
	$(CURL) $@ $(DARK_URL)/custom.css
doc/custom_dark_theme.css:
	$(CURL) $@ $(DARK_URL)/custom_dark_theme.css
