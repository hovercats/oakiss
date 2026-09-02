cflags{
	'-std=c99',
	'-pedantic',
	'-isystem $builddir/pkg/netbsd-curses/include',
}

pkg.deps = {
	'pkg/netbsd-curses/headers',
}

exe('yap', {
	'ansi.c',
	'commands.c',
	'display.c',
	'getcomm.c',
	'getline.c',
	'help.c',
	'keys.c',
	'machine.c',
	'main.c',
	'options.c',
	'output.c',
	'pattern.c',
	'process.c',
	'prompt.c',
	'rune.c',
	'term.c',
	'$builddir/pkg/netbsd-curses/libterminfo.a',
})

file('bin/yap', '755', '$outdir/yap')

fetch 'git'