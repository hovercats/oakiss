cflags{
	'-I $dir',
	'-I $srcdir/include',
	'-isystem $builddir/pkg/util-linux/include/blkid',
}

lib('libexfat.a', {
	'lib/exfat_dir.c',
	'lib/exfat_fs.c',
	'lib/libexfat.c',
	'lib/utils.c',
})

exe('fsck.exfat', {
	'fsck/fsck.c',
	'fsck/repair.c',
	'libexfat.a',
})

exe('mkfs.exfat', {
	'mkfs/crc.c',
	'mkfs/mkfs.c',
	'mkfs/upcase.c',
	'libexfat.a',
	'$builddir/pkg/util-linux/libblkid.a.d',
})

file('bin/fsck.exfat', '755', '$outdir/fsck.exfat')
file('bin/mkfs.exfat', '755', '$outdir/mkfs.exfat')

man{'manpages/fsck.exfat.8'}
man{'manpages/mkfs.exfat.8'}

fetch 'git'