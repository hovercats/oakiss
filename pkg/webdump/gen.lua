cflags{
	'-std=c99',
	'-D _DEFAULT_SOURCE',
	'-D _XOPEN_SOURCE=700',
	'-D _BSD_SOURCE',
}

lib('libxml.a', {'xml.c'})

exe('webdump', [[webdump.c strlcat.c strlcpy.c libxml.a]])


file('bin/webdump', '755', '$outdir/webdump')
man{'webdump.1'}

fetch 'git'
