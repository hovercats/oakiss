exe('u-config', {'generic_main.c'})

file('bin/u-config', '755', '$outdir/u-config')
man{'u-config.1'}

sym('bin/pkg-config', 'u-config')
sym('share/man/man1/pkg-config.1.gz', 'u-config.1.gz')

fetch 'git'
