cflags{
	'-std=c11',
	'-D _GNU_SOURCE',
	'-I $dir',
	'-I $outdir',
	'-I $outdir/protocol',
	'-I $outdir/include',
	'-I $srcdir/swc',
	'-I $srcdir/swc/libswc',
	'-isystem $builddir/pkg/fontconfig/include',
	'-isystem $builddir/pkg/libinput/include',
	'-isystem $builddir/pkg/libxkbcommon/include',
	'-isystem $builddir/pkg/libdrm/include',
	'-isystem $builddir/pkg/linux-headers/include',
	'-isystem $builddir/pkg/pixman/include',
	'-isystem $builddir/pkg/wayland-protocols/include',
	'-isystem $builddir/pkg/wayland/include',
	'-isystem $builddir/pkg/wld/include',
}

waylandproto('swc/protocol/swc.xml', {
	client='include/swc-client-protocol.h',
	server='include/swc-server-protocol.h',
	code='swc-protocol.c',
})

waylandproto('swc/protocol/server-decoration.xml', {
	server='include/server-decoration-server-protocol.h',
	code='server-decoration-protocol.c',
})

waylandproto('swc/protocol/swc_snap.xml', {
	server='protocol/swc_snap-server-protocol.h',
	code='swc_snap-protocol.c',
})

waylandproto('protocol/hevel.xml', {
	server='protocol/hevel-server-protocol.h',
	code='hevel-server.c',
})

pkg.hdrs = {
	'$outdir/protocol/hevel-server-protocol.h',
	'$outdir/protocol/swc_snap-server-protocol.h',
	'$outdir/include/server-decoration-server-protocol.h',
	'$outdir/include/swc-client-protocol.h',
	'$outdir/include/swc-server-protocol.h',
}

copy('$outdir/include', '$builddir/pkg/wld/protocol', {'wayland-drm-server-protocol.h'})

sub('tools.ninja', function()
	toolchain(config.host)
	cflags{'-std=c99', '-D _POSIX_C_SOURCE=200809L'}
	exe('convert_font', {'swc/cursor/convert_font.c'})
end)

rule('convert_font', '$outdir/convert_font $in $out 2>/dev/null')
build('convert_font', '$outdir/cursor/cursor_data.h', {'$srcdir/swc/cursor/cursor.pcf', '|', '$outdir/convert_font'})

pkg.deps = {
	'$gendir/headers',
	'$outdir/cursor/cursor_data.h',
	'$outdir/protocol/hevel-server-protocol.h',
	'$outdir/protocol/swc_snap-server-protocol.h',
	'pkg/fontconfig/headers',
	'pkg/libdrm/headers',
	'pkg/libinput/headers',
	'pkg/libxkbcommon/headers',
	'pkg/linux-headers/headers',
	'pkg/pixman/headers',
	'pkg/wayland/headers',
	'pkg/wayland-protocols/headers',
	'pkg/wld/headers',
}

lib('libswc.a', [[
	swc/libswc/(
		bindings.c compositor.c data.c
		data_device.c data_device_manager.c
		dmabuf.c drm.c input.c kde_decoration.c
		keyboard.c launch.c mode.c output.c
		panel.c panel_manager.c plane.c pointer.c
		primary_plane.c region.c screen.c shell.c
		shell_surface.c shm.c snap.c subcompositor.c
		subsurface.c surface.c swc.c util.c view.c
		wallpaper.c wayland_buffer.c window.c
		xdg_decoration.c xdg_shell.c seat.c
	)
	swc/launch/protocol.c
	server-decoration-protocol.c.o
	swc-protocol.c.o
	swc_snap-protocol.c.o
	$builddir/(
		pkg/libinput/libinput.a.d
		pkg/libxkbcommon/libxkbcommon.a
		pkg/wayland-protocols/xdg-decoration-unstable-v1-protocol.c.o
		pkg/wayland-protocols/xdg-shell-protocol.c.o
		pkg/wayland-protocols/linux-dmabuf-unstable-v1-protocol.c.o
		pkg/wayland/libwayland-server.a.d
		pkg/wld/libwld.a.d
	)
]])

exe('hevel', {
	'hevel.c',
	'hevel-server.c.o',
	'libswc.a',
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
