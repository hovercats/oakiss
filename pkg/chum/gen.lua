cflags{
	'-std=c99',
	'-pedantic',
	'-isystem $builddir/pkg/neuswc/include',
	'-isystem $builddir/pkg/wayland/include',
}

pkg.deps = {
	'pkg/neuswc/headers',
	'pkg/wayland/headers',
}

exe('chum', {
	'chum.c',
	'$builddir/pkg/neuswc/libswc.a.d'
})
file('bin/chum', '755', '$outdir/chum')

fetch 'git'