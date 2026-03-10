cflags{
	'-std=c99',
	'-D _POSIX_C_SOURCE=200809L',
	'-I $dir',
	'-I $srcdir/source/include',
	'-isystem $builddir/pkg/fontconfig/include',
	'-isystem $builddir/pkg/libdrm/include',
	'-isystem $builddir/pkg/libinput/include',
	'-isystem $builddir/pkg/libxkbcommon/include',
	'-isystem $builddir/pkg/swc/include',
	'-isystem $builddir/pkg/wld/include',
	'-isystem $builddir/pkg/pixman/include',
	'-isystem $builddir/pkg/wayland-protocols/include',
	'-isystem $builddir/pkg/wayland/include',
}

pkg.deps = {
	'pkg/fontconfig/headers',
	'pkg/libdrm/headers',
	'pkg/libinput/headers',
	'pkg/libxkbcommon/headers',
	'pkg/swc/headers',
	'pkg/wld/headers',
	'pkg/pixman/headers',
	'pkg/wayland/headers',
	'pkg/wayland-protocols/headers',
}

exe('wsxwm', {
	'source/wsxwm.c',
	'source/util.c',
	'$builddir/pkg/swc/libswc.a',
	'$builddir/pkg/wld/libwld.a',
	'$builddir/pkg/pixman/libpixman.a',
	'$builddir/pkg/libinput/libinput.a.d',
	'$builddir/pkg/libxkbcommon/libxkbcommon.a',
	'$builddir/pkg/libdrm/libdrm.a',
	'$builddir/pkg/wayland/libwayland-server.a.d',
	'$builddir/pkg/fontconfig/libfontconfig.a.d',
})

file('bin/wsxwm', '755', '$outdir/wsxwm')

fetch 'git'