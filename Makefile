.PHONY: all

all:
	$(MAKE) -C src $@

.DEFAULT:
	$(MAKE) -C src $@
