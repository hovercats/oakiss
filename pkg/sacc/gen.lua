cflags {
	'-pedantic',
	'-std=c99',
	'-D USE_TLS',
	'-D _GNU_SOURCE',
	'-D _XOPEN_SOURCE=700',
	'-I $dir',
	'-isystem $builddir/pkg/libtls-bearssl/include',
	'-isystem $builddir/pkg/bearssl/include',
	'-isystem $builddir/pkg/netbsd-curses/include',
}

pkg.deps = {
	'pkg/libtls-bearssl/headers',
	'pkg/bearssl/headers',
	'pkg/netbsd-curses/headers',
}

exe('sacc', [[
	io_tls.c sacc.c ui_ti.c

	$builddir/pkg/libtls-bearssl/libtls.a
	$builddir/pkg/bearssl/libbearssl.a
	$builddir/pkg/netbsd-curses/libterminfo.a
]]
)

file('bin/sacc', '755', '$outdir/sacc')
man{'sacc.1'}

fetch 'git'