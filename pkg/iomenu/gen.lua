cflags{
	[[-D 'VERSION="0.1"']],
	'-D _POSIX_C_SOURCE=20009L',
	'-D _BSD_SOURCE',
	'-std=c99',
	'-pedantic',
}

exe('iomenu', [[iomenu.c utf8.c compat.c wcwidth.c term.c]])
file('bin/iomenu', '755', '$outdir/iomenu')
man{'iomenu.1'}

fetch 'git'
