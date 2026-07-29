cflags{
	'-pedantic',
	'-std=c17',
	[[-D 'VERSION="1.0"']],
	'-D _GNU_SOURCE',
	'-D _POSIX_C_SOURCE=200809L',
	'-I $outdir/include',
	'-isystem $builddir/pkg/linux-headers/include',
	'-isystem $builddir/pkg/wayland/include',
	'-isystem $builddir/pkg/wayland-protocols/include',
}

waylandproto('wlr-layer-shell-unstable-v1.xml', {
	client='include/wlr-layer-shell-unstable-v1-protocol.h',
	code='wlr-layer-shell-unstable-v1.c',
})

pkg.deps = {
	'$outdir/include//wlr-layer-shell-unstable-v1-protocol.h',
	'pkg/linux-headers/headers',
	'pkg/wayland/headers',
	'pkg/wayland-protocols/headers',
}

exe('wawa', {
	'wawa.c',
	'wlr-layer-shell-unstable-v1.c.o',
	'$builddir/pkg/wayland-protocols/xdg-shell-protocol.c.o',
	'$builddir/pkg/wayland/libwayland-client.a.d',
	'$builddir/pkg/wayland/libwayland-server.a.d',
})

file('bin/wawa', '755', '$outdir/wawa')

fetch 'git'
