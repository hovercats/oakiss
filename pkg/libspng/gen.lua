cflags{
	'-std=c99',
}

pkg.hdrs = copy('$outdir/include', '$srcdir/spng', {'spng.h'})

lib('libspng.a', {'spng/spng.c'})

fetch 'git'
