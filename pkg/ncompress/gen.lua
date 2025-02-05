cflags{
	'-std=c99', '-Wall', '-Wpedantic',
	'-D _POSIX_C_SOURCE=200809L',
	'-D UTIME_H',
	'-D LSTAT',
	'-D USERMEM=800000',
}

exe('compress', {'compress.c'})
file('bin/compress', '755', '$outdir/compress')

sym('bin/ucompress', 'compress')

fetch 'git'
