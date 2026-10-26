cflags{
	'-std=c99',
	'-pedantic',
	'-D _XOPEN_SOURCE=700',
	'-D BACKEND_WAY',
	'-I $dir',
	'-I $srcdir/include',
	'-isystem $builddir/pkg/maus/include',
}

pkg.deps = {
	'pkg/maus/headers',
}

exe('cterm', [[source/(
	cterm.c utils.c font.c
	term.c draw.c
	)
	$builddir/pkg/maus/libmaus.a.d
]])

file('bin/cterm', '755', '$outdir/cterm')

fetch 'git'
