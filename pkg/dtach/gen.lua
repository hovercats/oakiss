cflags{
	'-I $dir',
	'-I $srcdir',
	'-pedantic',
	'-Wall',
	'-Wextra',
}

exe('dtach', {
	'main.c',
	'master.c',
	'attach.c',
})

file('bin/dtach', '755', '$outdir/dtach')

man{'dtach.1'}
