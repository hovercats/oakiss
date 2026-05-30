cflags {
	[[-D 'VERSION="0.7.0"']],
	'-D _XOPEN_SOURCE=700',
	'-isystem $builddir/pkg/libxkbcommon/include',
	'-isystem $builddir/pkg/wayland/include',
	'-isystem $builddir/pkg/wayland-protocols/include',
}

pkg.deps = {
	'pkg/libxkbcommon/headers',
	'pkg/wayland/headers',
	'pkg/wayland-protocols/headers',
	'$builddir/pkg/wayland-protocols/xdg-shell-protocol.c.o',
	'$builddir/pkg/wayland-protocols/xdg-decoration-unstable-v1-protocol.c.o',
	'$builddir/pkg/wayland-protocols/primary-selection-unstable-v1-protocol.c.o',
}


exe('havoc', [[
	main.c glyph.c 
	tsm/(
		wcwidth.c shl-htable.c tsm-render.c
		tsm-screen.c tsm-selection.c tsm-unicode.c
		tsm-vte-charsets.c tsm-vte.c
	)
	$builddir/pkg/(
		wayland-protocols/xdg-shell-protocol.c.o
		wayland-protocols/xdg-decoration-unstable-v1-protocol.c.o
		wayland-protocols/primary-selection-unstable-v1-protocol.c.o
		libxkbcommon/libxkbcommon.a
		wayland/libwayland-client.a.d
		wayland/libwayland-cursor.a.d
	)
]])

file('bin/havoc', '755', '$outdir/havoc')

file('share/doc/havoc/havoc.cfg.sample', '644', '$srcdir/havoc.cfg')

fetch 'git'