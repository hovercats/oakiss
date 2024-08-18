cflags{
	string.format([[-D 'VELOX_LIBEXEC="%s/libexec/velox"']], config.prefix),
	'-I $outdir',
	'-isystem $builddir/pkg/fontconfig/include',
	'-isystem $builddir/pkg/libinput/include',
	'-isystem $builddir/pkg/libxkbcommon/include',
	'-isystem $builddir/pkg/linux-headers/include',
	'-isystem $builddir/pkg/pixman/include',
	'-isystem $builddir/pkg/swc/include',
	'-isystem $builddir/pkg/wayland/include',
	'-isystem $builddir/pkg/wld/include',
}

waylandproto('protocol/velox.xml', {
	client='protocol/velox-client-protocol.h',
	server='protocol/velox-server-protocol.h',
	code='velox-protocol.c',
})
build('copy', '$outdir/protocol/swc-client-protocol.h', '$builddir/pkg/swc/include/swc-client-protocol.h')

pkg.deps = {
	'$outdir/protocol/swc-client-protocol.h',
	'$outdir/protocol/velox-client-protocol.h',
	'$outdir/protocol/velox-server-protocol.h',
	'pkg/fontconfig/headers',
	'pkg/libinput/headers',
	'pkg/libxkbcommon/headers',
	'pkg/linux-headers/headers',
	'pkg/pixman/headers',
	'pkg/swc/headers',
	'pkg/wayland/headers',
	'pkg/wld/headers',
}

exe('velox', {
	'config.c',
	'layout.c',
	'screen.c',
	'tag.c',
	'util.c',
	'velox.c',
	'velox-protocol.c.o',
	'window.c',
	'$builddir/pkg/swc/libswc.a.d',
	'$builddir/pkg/wayland/libwayland-server.a.d',
})
file('bin/velox', '755', '$outdir/velox')

exe('status_bar', {
	'clients/status_bar.c',
	'velox-protocol.c.o',
	'$builddir/pkg/swc/swc-protocol.c.o',
	'$builddir/pkg/wld/libwld.a.d',
	'$builddir/pkg/wayland/libwayland-client.a.d',
})
file('libexec/velox/status_bar', '755', '$outdir/status_bar')

file('share/doc/velox/velox.conf.sample', '644', '$srcdir/velox.conf.sample')

fetch 'git'
