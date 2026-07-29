cflags{
	[[-D 'VERSION="0.2.0"']],
	'-std=c99',
	'-pedantic',
	'-D _XOPEN_SOURCE=700',
	'-I $srcdir/include',
	'-isystem $builddir/pkg/fontconfig/include',
	'-isystem $builddir/pkg/libdrm/include',
	'-isystem $builddir/pkg/libinput/include',
	'-isystem $builddir/pkg/libspng/include',
	'-isystem $builddir/pkg/libxkbcommon/include',
	'-isystem $builddir/pkg/neuswc/include',
	'-isystem $builddir/pkg/pixman/include',
	'-isystem $builddir/pkg/wayland-protocols/include',
	'-isystem $builddir/pkg/wayland/include',
	'-isystem $builddir/pkg/wld/include',
}

pkg.deps = {
	'pkg/fontconfig/headers',
	'pkg/libdrm/headers',
	'pkg/libinput/headers',
	'pkg/libspng/headers',
	'pkg/libxkbcommon/headers',
	'pkg/neuswc/headers',
	'pkg/wld/headers',
	'pkg/pixman/headers',
	'pkg/wayland/headers',
	'pkg/wayland-protocols/headers',
}

exe('howl', {
	'src/decor.c',
	'src/ipc.c',
	'src/log.c',
	'src/howl.c',
	'$builddir/pkg/neuswc/libswc.a.d',
	'$builddir/pkg/libspng/libspng.a',
})

exe('howlc', {
	'src/client.c',
})

file('bin/howl', '755', '$outdir/howl')
file('bin/howlc', '755', '$outdir/howlc')

man{'doc/howl.1'}
man{'doc/howlc.1'}

fetch 'git'
