cflags{
	'-Wall',
	'-D _GNU_SOURCE',
	'-D screen_new=swc__screen_new',
	'-D remove_resource=swc__remove_resource',
	'-I $outdir',
	'-I $outdir/include',
	'-I $srcdir',
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

cc('launch/protocol.c')

waylandproto('protocol/swc.xml', {
	client='include/swc-client-protocol.h',
	server='include/swc-server-protocol.h',
	code='swc-protocol.c',
})

waylandproto('protocol/server-decoration.xml', {
	server='include/server-decoration-server-protocol.h',
	code='server-decoration-protocol.c',
})

waylandproto('protocol/swc_snap.xml', {
       server='include/swc_snap-server-protocol.h',
       client='include/swc_snap-client-protocol.h',
       code='swc_snap-protocol.c',
})

waylandproto('protocol/swc_select.xml', {
       server='include/swc_select-server-protocol.h',
       client='include/swc_select-client-protocol.h',
       code='swc_select-protocol.c',
})

waylandproto('protocol/wayland-drm.xml', {
       server='include/wayland-drm-server-protocol.h',
       code='wayland-drm-protocol.c',
})

waylandproto('protocol/wlr-layer-shell-unstable-v1.xml', {
       client='include/wlr-layer-shell-unstable-v1-client-protocol.h',
       server='include/wlr-layer-shell-unstable-v1-server-protocol.h',
       code='wlr-layer-shell-unstable-v1.c'
})

pkg.hdrs = {
	copy('$outdir/include', '$srcdir/libswc', {'swc.h'}),
}

sub('tools.ninja', function()
	toolchain(config.host)
	cflags{'-std=c99', '-D _POSIX_C_SOURCE=200809L'}
	exe('convert_font', {'cursor/convert_font.c'})
end)

rule('convert_font', '$outdir/convert_font $in $out 2>/dev/null')
build('convert_font', '$outdir/cursor/cursor_data.h', {'$srcdir/cursor/cursor.pcf', '|', '$outdir/convert_font'})

pkg.deps = {
	'$gendir/headers',
	'$outdir/include/swc-client-protocol.h',
	'$outdir/include/swc-server-protocol.h',
	'$outdir/include/swc_snap-server-protocol.h',
	'$outdir/include/swc_snap-client-protocol.h',
	'$outdir/include/server-decoration-server-protocol.h',
	'$outdir/include/swc_select-server-protocol.h',
	'$outdir/include/swc_select-client-protocol.h',
	'$outdir/include/wlr-layer-shell-unstable-v1-client-protocol.h',
	'$outdir/include/wlr-layer-shell-unstable-v1-server-protocol.h',
	'$outdir/include/wayland-drm-server-protocol.h',
	'$outdir/cursor/cursor_data.h',
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
	libswc/(
		bindings.c
		compositor.c
		data.c
		data_device.c
		data_device_manager.c
		decor.c
		dmabuf.c
		drm.c
		input.c
		kde_decoration.c
		keyboard.c
		launch.c
		layer_shell.c
		mode.c
		output.c
		panel.c
		panel_manager.c
		plane.c
		pointer.c
		primary_plane.c
		region.c
		screen.c
		select.c
		shell.c
		shell_surface.c
		shm.c
		snap.c
		subcompositor.c
		subsurface.c
		surface.c
		swc.c
		util.c
		view.c
		wayland_buffer.c
		window.c
		xdg_decoration.c
		xdg_output.c
		xdg_shell.c

		seat.c
	)
	launch/protocol.c.o
	server-decoration-protocol.c.o
	swc-protocol.c.o
	swc_snap-protocol.c.o
	swc_select-protocol.c.o
	wayland-drm-protocol.c.o
	wlr-layer-shell-unstable-v1.c.o
	$builddir/(
		pkg/libinput/libinput.a.d
		pkg/libxkbcommon/libxkbcommon.a
		pkg/wayland-protocols/xdg-decoration-unstable-v1-protocol.c.o
		pkg/wayland-protocols/xdg-shell-protocol.c.o
		pkg/wayland-protocols/xdg-output-unstable-v1-protocol.c.o
		pkg/wayland-protocols/linux-dmabuf-unstable-v1-protocol.c.o
		pkg/wayland/libwayland-server.a.d
		pkg/wld/libwld.a.d
	)
]])

exe('swcsnap', {'extra/swcsnap.c', 'libswc.a.d'})
file('bin/swcsnap', '755', '$outdir/swcsnap')

exe('neuswc-launch', {'launch/launch.c', 'launch/devmajor-linux.c', 'launch/protocol.c.o', '$builddir/pkg/libdrm/libdrm.a'})
file('bin/neuswc-launch', '4755', '$outdir/neuswc-launch')

fetch 'git'
