cflags{
	'-std=c99',
	'-D _POSIX_C_SOURCE=2000809L',
	'-I $outdir/protocol',
	'-isystem $builddir/pkg/wayland/include',
}

waylandproto('swc_wallpaper.xml', {
	client='protocol/swc_wallpaper-client-protocol.h',
	code='swc_wallpaper-protocol.c',
})

pkg.deps = {
	'$outdir/protocol/swc_wallpaper-client-protocol.h',
	'pkg/wayland/headers',
}

exe('swall', {
	'swall.c',
	'swc_wallpaper-protocol.c.o',
	'$builddir/pkg/wayland/libwayland-server.a.d',
	'$builddir/pkg/wayland/libwayland-client.a.d',
})

file('bin/swall', '755', '$outdir/swall')

fetch 'git'