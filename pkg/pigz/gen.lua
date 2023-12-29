cflags{
	'-Wall', '-Wextra', '-Wno-clobbered', '-Wno-stringop-overflow',
	'-D NOZOPFLI',
	'-isystem $builddir/pkg/zlib/include',
}

exe('pigz', [[
	pigz.c yarn.c try.c
	$builddir/pkg/zlib/libz.a
]], {'pkg/zlib/headers'})
file('bin/pigz', '755', '$outdir/pigz')
man{'pigz.1'}
for _, alias in ipairs{'gzip', 'gunzip', 'zcat'} do
	sym('bin/'..alias, 'pigz')
	sym('share/man/man1/'..alias..'.1.gz', 'pigz.1.gz')
end

fetch 'git'
