cflags{
	'-std=c99',
	'-pedantic',
	'-Wall',
}

pkg.hdrs = copy('$outdir/include', '$srcdir', {'xxh3.h', 'xxhash.h'})

lib('libxxhash.a', {'xxhash.c'})

exe('xxhsum', [[
	cli/(
		xxhsum.c xsum_os_specific.c xsum_arch.c
		xsum_output.c xsum_sanity_check.c
		xsum_bench.c
	)
	libxxhash.a
]])

file('bin/xxhsum', '755', '$outdir/xxhsum')
man{'cli/xxhsum.1'}

fetch 'git'
