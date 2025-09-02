set('version', '2.0')
cflags{
	'-Wall', '-Wno-format-truncation',
	[[-D 'VERSION="$version"']],
}

exe('ii', {'ii.c'})
file('bin/ii', '755', '$outdir/ii')

build('sed', '$outdir/ii.1', '$srcdir/ii.1', {expr='s,VERSION,$version,'})
man{'$outdir/ii.1'}

fetch 'git'
