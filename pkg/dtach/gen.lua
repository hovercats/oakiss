cflags{
	'-pedantic',
	'-I $dir',
}

exe('dtach', {'attach.c', 'master.c', 'main.c'})

file('bin/dtach', '755', '$outdir/dtach')

man{'dtach.1'}

fetch 'git'
