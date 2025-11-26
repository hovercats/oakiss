cflags{
	'-std=c99', '-Wall', '-Wpedantic',
	'-D _POSIX_C_SOURCE=200809L',
	'-I $dir',
	'-I $srcdir/h',
}

lib('libbc.a', [[lib/(getopt.c getopt1.c vfprintf.c number.c)]])

exe('bin/bc', [[
	bc/(
		main.c bc.c scan.c execute.c load.c storage.c util.c global.c
		warranty.c
	)
	$outdir/libbc.a
]])

exe('bin/dc', [[
	dc/(
		dc.c misc.c eval.c stack.c array.c numeric.c string.c
	)
	$outdir/libbc.a
]])

file('bin/bc', '755', '$outdir/bin/bc')
file('bin/dc', '755', '$outdir/bin/dc')

man{'doc/bc.1'}
man{'doc/dc.1'}

fetch 'curl'
