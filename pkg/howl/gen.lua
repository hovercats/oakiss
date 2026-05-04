cflags{
	[[-D 'VERSION="0.1.0"']],
	'-std=c99',
	'-pedantic',
	'-D _XOPEN_SOURCE=700',
	'-I $srcdir/include',
	'-isystem $builddir/pkg/fontconfig/include',
	'-isystem $builddir/pkg/libdrm/include',
	'-isystem $builddir/pkg/libinput/include',
	'-isystem $builddir/pkg/libxkbcommon/include',
	'-isystem $builddir/pkg/swc/include',
	'-isystem $builddir/pkg/wld/include',
	'-isystem $builddir/pkg/pixman/include',
	'-isystem $builddir/pkg/wayland-protocols/include',
	'-isystem $builddir/pkg/wayland/include',
}

pkg.deps = {
	'pkg/fontconfig/headers',
	'pkg/libdrm/headers',
	'pkg/libinput/headers',
	'pkg/libxkbcommon/headers',
	'pkg/swc/headers',
	'pkg/wld/headers',
	'pkg/pixman/headers',
	'pkg/wayland/headers',
	'pkg/wayland-protocols/headers',
}

exe('howl', {
	'src/ipc.c',
	'src/log.c',
	'src/howl.c',
	'$builddir/pkg/swc/libswc.a.d',
})

exe('howlc', {
	'src/client.c',
})

file('bin/howl', '755', '$outdir/howl')
file('bin/howlc', '755', '$outdir/howlc')

man{'doc/howl.1'}
man{'doc/howlc.1'}

fetch 'git'
