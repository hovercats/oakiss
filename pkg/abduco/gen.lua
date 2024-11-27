cflags{
	[[-D 'VERSION="0.6"']],
	'-I $dir',
	'-pedantic',
	'-std=c99',
	'-D _POSIX_C_SOURCE=200809L',
	'-D _XOPEN_SOURCE=700',
	'-D NDEBUG',
	'-Wall',
}

exe('abduco', {'abduco.c'})

file('bin/abduco', '755', '$outdir/abduco')
man{'abduco.1'}

fetch 'curl'
