cflags{
	'-std=c99',
	'-pedantic',
	'-D _XOPEN_SOURCE=700',
	'-D BACKEND_WAY',
	'-I $dir',
	'-I $srcdir/include',
	'-I $srcdir/libmaus/include',
	'-isystem $builddir/pkg/libxkbcommon/include',
	'-isystem $builddir/pkg/wayland/include',
	'-isystem $builddir/pkg/wayland-protocols/include',
}

pkg.deps = {
	'pkg/libxkbcommon/headers',
	'pkg/wayland/headers',
	'pkg/wayland-protocols/headers',
}

lib('libmaus.a', [[libmaus/source/(
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

exe('cterm', [[source/(
	cterm.c utils.c font.c
	term.c draw.c
	)
	libmaus.a.d
]])

file('bin/cterm', '755', '$outdir/cterm')

fetch 'git'
