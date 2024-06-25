cflags {
	[['-D VERSION="1.5.0"']],
	'-std=c99',
	'-pedantic',
	'-Wall',
}

exe('smu', {'smu.c'})
file('bin/smu', '755', '$outdir/smu')

man{'smu.1'}

fetch 'git'
