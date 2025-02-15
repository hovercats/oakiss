# muon


## version.c
Generated with

	muon setup \
		-Dlibcurl=disabled \
		-Dsamurai=disabled \
		-Dlibarchive=disabled \
		-Dreadline=builtin \
		-Dlibpkgconf=disabled \
		build

Note: to be correct about our configuration, we would enable `libpkgconf` here, but muon will simply error out on not being able to find them, even when pointed to using LDFLAGS and CFLAGS. The configuration however seems to be unaffected by this, so we can safely disable it to generate the above files.
