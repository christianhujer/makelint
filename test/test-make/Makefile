.PHONY: test
test: test-make-goodcase test-make-badcase

.PHONY: test-make-goodcase
test-make-goodcase:
	$(MAKE) -C $@

.PHONY: test-make-badcase
test-make-badcase:
	if $(MAKE) -C $@ ; then exit 1 ; fi
