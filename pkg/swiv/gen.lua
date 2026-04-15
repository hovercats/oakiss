cflags{
	'-std=c99',
	'-I $outdir',
	'-isystem $builddir/pkg/fontconfig/include',
	'-isystem $builddir/pkg/pixman/include',
	'-isystem $builddir/pkg/wayland/include',
	'-isystem $builddir/pkg/wld/include',
}

pkg.deps = {
	'$outdir/protocol/xdg-shell-client-protocol.h',
	'pkg/fontconfig/headers',
	'pkg/pixman/headers',
	'pkg/wayland/headers',
	'pkg/wld/headers',
}

waylandproto('protocol/xdg-shell.xml', {
	client='protocol/xdg-shell-client-protocol.h',
	code='protocol/xdg-shell.c'
})

exe('swiv', {
	'swiv.c',
	'image.c',
	'$outdir/protocol/xdg-shell.c.o',
	'$builddir/pkg/wld/libwld.a.d',
})

file('bin/swiv', '755', '$outdir/swiv')

fetch 'git'