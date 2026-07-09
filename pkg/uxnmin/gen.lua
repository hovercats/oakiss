cflags{
	'-std=c89',
	'-pedantic',
	'-D _POSIX_C_SOURCE=199309L',
}

exe('uxnmin', {'src/uxnmin.c'})

file('bin/uxnmin', '755', '$outdir/uxnmin')

fetch 'git'
