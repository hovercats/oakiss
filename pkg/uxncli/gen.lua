cflags{
	'-std=c99',
	'-pedantic',
	'-D _POSIX_C_SOURCE=199309L',
}

exe('uxncli', {'src/uxncli.c'})

file('bin/uxncli', '755', '$outdir/uxncli')

fetch 'git'