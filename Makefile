.PHONY: test
test:
	$(MAKE) -C $@

.PHONY: clean
clean::
	find -name .makelint_success | xargs $(RM)
