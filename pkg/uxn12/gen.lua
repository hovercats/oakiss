cflags{
	'-std=c99',
	'-pedantic',
	'-D _POSIX_C_SOURCE=199309L',
	'-I $outdir/include',
	'-isystem $builddir/pkg/alsa-lib/include',
	'-isystem $builddir/pkg/libxkbcommon/include',
	'-isystem $builddir/pkg/linux-headers/include',
	'-isystem $builddir/pkg/wayland/include',
	'-isystem $builddir/pkg/wayland-protocols/include',
}

waylandproto('src/wlr-layer-shell-unstable-v1.xml', {
	client='include/wlr-layer-shell-client-protocol.h',
	code='wlr-layer-shell-client-protocol.c',
})

pkg.deps = {
	'$outdir/include/wlr-layer-shell-client-protocol.h',
	'pkg/alsa-lib/headers',
	'pkg/libxkbcommon/headers',
	'pkg/linux-headers/headers',
	'pkg/wayland/headers',
	'pkg/wayland-protocols/headers',
}

exe('uxn12', {
	'src/uxn12.c',
	'wlr-layer-shell-client-protocol.c.o',
	'$builddir/pkg/wayland-protocols/xdg-shell-protocol.c.o',
	'$builddir/pkg/alsa-lib/libasound.a',
	'$builddir/pkg/libxkbcommon/libxkbcommon.a',
	'$builddir/pkg/wayland/libwayland-client.a.d',
})

file('bin/uxn12', '755', '$outdir/uxn12')

man{'doc/man/uxntal.7'}

fetch 'git'
