TESTS:=$(wildcard test-*)

.PHONY: test
test: $(TESTS)
	echo $(TESTS)

.PHONY: $(TESTS)
$(TESTS):
	$(MAKE) -C $@
