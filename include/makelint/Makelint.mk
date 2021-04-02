ifeq (undefined,$(origin MAKELINT/LINT.MK))
MAKELINT/LINT.MK:=$(lastword $(MAKEFILE_LIST))
MAKELINT:=$(firstword $(wildcard $(firstword $(dir $(lastword $(MAKEFILE_LIST)))/../../bin/makelint)) makelint)

# File to include from your Makefile like this:
# -include makelint/Makelint.mk

.PHONY: makelint
## Runs makelint on all Makefiles
makelint: .makelint_success
.makelint_success: $(MAKEFILE_LIST)
	$(MAKELINT) $(MAKEFILE_LIST)
	touch $@

endif
