cflags{ 
	[[-D 'VERSION="1.11.3"']],
	'-std=c99',
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

rule('doc', '$outdir/scdoc < $in >$out')
build('doc', '$outdir/scdoc.1', '$srcdir/scdoc.1.scd')
build('doc', '$outdir/scdoc.5', '$srcdir/scdoc.5.scd')

man{'$outdir/scdoc.1'}
man{'$outdir/scdoc.5'}

fetch 'git'
