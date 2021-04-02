# makelint
A small lint for Makefiles.
It finds typical mistakes that users do when writing Makefiles.

## Checks

### `rm`
`rm` should not be used.
Instead, use `$(RM)`.
`$(RM)` is a predefined variable and expands to `rm -f`.

There are at least two reasons why `$(RM)` should be used instead of `rm`:
- `$(RM)` will not fail in case a file didn't exist in the first place.
- On other platforms, `$(RM)` is automatically replaced with whatever the platform uses, for example, `del` on `cmd.exe`.

### `make`
`make` should not be used within a `Makefile`.
Instead, use `$(MAKE)`.
`$(MAKE)` is predefined with some special magic making sure that the new make would participate in the calling make's job server and other benefits.

## Using `makelint` without installation
To use `makelint` in your project without installing it, append the following lines to _the end_ of your `Makefile`:

```
test: makelint

-include .makelint/include/makelint/Makelint.mk
.makelint/include/makelint/Makelint.mk:
	git clone --depth=1 https://github.com/christianhujer/makelint.git .makelint
```

Change `test` to the target name for which you want `makelint` to be executed.

It is important that the `-include` directive to include `Makelint.mk` is the last include directive of your `Makefile`.
If it isn't, the incremental feature of `makelint` to only re-run the checks in case there were failures or changes will not work properly.

## Installing `makelint`
`makelint` can run with or without installation.
If you want to install `makelint`, run `sudo make install`.

Per default, the include files are installed in `/usr/local/include/makelint/` and the binary files are installed in `/usr/local/bin/`.

## Using `makelint`
### Running `makelint` from your `Makefile`
To run `makelint` from your `Makefile`, simply include the following line in your `Makefile`:
```
-include makelint/Makelint.mk
```

Alternatively, you can create your own target, the simple way:
```
.PHONY: makelint
makelint:
    makelint $(MAKEFILE_LIST)
```
or, if you prefer, the incremental way:
```
.PHONY: makelint
makelint: .makelint_success
.makelint_success: $(MAKEFILE_LIST)
    makelint $^
    touch $@
```
