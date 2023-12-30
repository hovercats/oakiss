file('bin/rcinit', '755', '$srcdir/rcinit')
sym('bin/init', 'rcinit')

file('bin/shutdown', '755', '$dir/shutdown')

fetch 'git'