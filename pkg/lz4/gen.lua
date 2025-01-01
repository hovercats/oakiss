cflags{
	'-std=c99',
	'-pedantic',
	'-D LZ4IO_MULTITHREAD',
	'-D LZ4_FAST_DEC_LOOP=1',
	'-D XXH_NAMESPACE=LZ4_',
	'-I $srcdir/lib',
}

lib('liblz4.a', [[lib/(
	lz4.c lz4file.c
	lz4frame.c lz4hc.c
	xxhash.c
)]])
exe('lz4', [[programs/(
	bench.c lorem.c lz4cli.c
	lz4io.c threadpool.c
	timefn.c util.c
	)
	liblz4.a
]])


file('bin/lz4', '755', '$outdir/lz4')
sym('bin/lz4c', 'lz4')

man{'programs/lz4.1'}

fetch 'git'