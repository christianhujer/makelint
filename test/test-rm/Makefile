.PHONY: test
test: test-rm-goodcase test-rm-badcase

.PHONY: test-rm-goodcase
test-rm-goodcase:
	$(MAKE) -C $@

.PHONY: test-rm-badcase
test-rm-badcase:
	if $(MAKE) -C $@ ; then exit 1 ; fi
