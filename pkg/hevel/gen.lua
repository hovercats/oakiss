cflags{
	'-std=c11',
	'-D _GNU_SOURCE',
	'-I $dir',
	'-isystem $builddir/pkg/fontconfig/include',
	'-isystem $builddir/pkg/libdrm/include',
	'-isystem $builddir/pkg/libinput/include',
	'-isystem $builddir/pkg/libxkbcommon/include',
	'-isystem $builddir/pkg/linux-headers/include',
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
	'pkg/linux-headers/headers',
	'pkg/pixman/headers',
	'pkg/wayland/headers',
	'pkg/wayland-protocols/headers',
	'pkg/wld/headers',
	'pkg/swc/headers',
}

exe('hevel', {
	'src/hevel.c',
	'src/input.c',
	'src/scroll.c',
	'src/select.c',
	'src/window.c',
	'src/zoom.c',
	'$builddir/pkg/swc/libswc.a',
	'$builddir/pkg/wld/libwld.a',
	'$builddir/pkg/wayland/libwayland-server.a.d',
	'$builddir/pkg/libinput/libinput.a.d',
	'$builddir/pkg/pixman/libpixman.a',
	'$builddir/pkg/libxkbcommon/libxkbcommon.a',
	'$builddir/pkg/libdrm/libdrm.a',
	'$builddir/pkg/fontconfig/libfontconfig.a.d',
})

file('bin/hevel', '755', '$outdir/hevel')

fetch 'git'
