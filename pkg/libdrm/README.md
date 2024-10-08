# libdrm

# `config.h`
Generated with

	muon setup \
		-Dintel=disabled \
		-Dnouveau=disabled \
		-Dradeon=disabled \
		-Dvmwgfx=disabled
		build

`HAVE_INTEL` and `HAVE_NOUVEAU` were removed since they get defined
in `gen.lua` based on the keys in `config.video_drivers`.
