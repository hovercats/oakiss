cflags{ 
	[[-D 'VERSION="1.11.3"']],
	'-std=c99',
	'-pedantic',
	'-Wall',
	'-Wno-unused-parameter',
	'-I $srcdir/include',
}

exe('scdoc', [[
	src/(
		main.c string.c
		utf8_chsize.c utf8_decode.c
		utf8_encode.c utf8_fgetch.c
		utf8_fputch.c utf8_size.c
		util.c
	)
]])

file('bin/scdoc', '755', '$outdir/scdoc')

fetch 'git'
