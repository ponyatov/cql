.PHONY: ai tmp/$(APP).ai.md
ai: tmp/$(APP).ai.md
tmp/$(APP).ai.md:
	cat $(HOME)/metadoc/$(APP)/*.md > $@ ; touch $@
