cflags{
	'-std=c99',
	'-pedantic',
	'-D _POSIX_C_SOURCE=199309L',
	'-isystem $builddir/pkg/libxkbcommon/include',
	'-isystem $builddir/pkg/wayland/include',
	'-isystem $builddir/pkg/wayland-protocols/include',
}

pkg.deps = {
	'pkg/libxkbcommon/headers',
	'pkg/wayland/headers',
	'pkg/wayland-protocols/headers',
}

exe('uxn12', {
	'src/uxn12.c',
	'src/xdg-shell-protocol.c',
	'$builddir/pkg/libxkbcommon/libxkbcommon.a',
	'$builddir/pkg/wayland/libwayland-client.a.d',
})

file('bin/uxn12', '755', '$outdir/uxn12')

man{'doc/man/uxntal.7'}

fetch 'git'
