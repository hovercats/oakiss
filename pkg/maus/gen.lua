cflags{
	'-std=c99',
	'-D BACKEND_WAY',
	'-I $srcdir/include',
	'-isystem $builddir/pkg/libxkbcommon/include',
	'-isystem $builddir/pkg/wayland/include',
	'-isystem $builddir/pkg/wayland-protocols/include',
}

pkg.deps = {
	'pkg/libxkbcommon/headers',
	'pkg/wayland/headers',
	'pkg/wayland-protocols/headers',
}

pkg.hdrs = copy('$outdir/include', '$srcdir/include', {
	'maus.h', 'maus_wayland.h', 'maus_input.h', 'uletypes.h'
})

lib('libmaus.a', [[source/(
	maus.c maus_font.c
	maus_wayland.c utils.c
	)
	$builddir/pkg/(
		wayland-protocols/xdg-shell-protocol.c.o
		wayland-protocols/pointer-constraints-unstable-v1-protocol.c.o
		wayland-protocols/relative-pointer-unstable-v1-protocol.c.o
		libxkbcommon/libxkbcommon.a
		wayland/libwayland-cursor.a.d
		wayland/libwayland-client.a.d
	)
]])

fetch 'git'
