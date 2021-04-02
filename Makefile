.PHONY: test
test:
	$(MAKE) -C $@

.PHONY: clean
clean::
	find -name .makelint_success | xargs $(RM)

.PHONY: it\ so
it\ so: test
	git diff-index --quiet HEAD --
	git push
