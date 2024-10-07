cflags{
	'-Wall',
	'-std=c99',
	'-Wpedantic',
	'-D MUON_PLATFORM_posix',
	'-D MUON_ENDIAN=0',
	'-D MUON_STATIC',
	'-D MUON_BOOTSTRAPPED',
	'-I $srcdir/include',
	'-I $srcdir/subprojects/tinyjson',
	'-I $dir',
	'-isystem $builddir/pkg/libpkgconf',
}

build('copy', '$outdir/version.c', '$dir/version.c')

pkg.deps = {'pkg/libpkgconf/headers'}

lib('libtinyjson.a', {'subprojects/tinyjson/tiny-json.c'})

exe('muon', [[
$outdir/version.c
src/(
    args.c cmd_install.c cmd_test.c
    coerce.c compilers.c embedded.c
    error.c guess.c install.c log.c
    machine_file.c machines.c main.c
    memmem.c meson_opts.c options.c
    opts.c rpmvercmp.c sha_256.c wrap.c
    backend/(
    	backend.c common_args.c ninja.c output.c
    	ninja/(
    		alias_target.c build_target.c
    		custom_target.c rules.c
    	)
    )
    datastructures/(
    	arr.c bucket_arr.c hash.c stack.c
    )
    formats/(
    	editorconfig.c ini.c
    	lines.c tap.c
    )
    functions/(
    	array.c boolean.c both_libs.c
    	build_target.c compiler.c
    	configuration_data.c custom_target.c
    	dependency.c dict.c disabler.c
    	environment.c external_program.c
    	feature_opt.c file.c generator.c
	    kernel.c modules.c machine.c meson.c
    	number.c run_result.c
    	source_configuration.c source_set.c
    	string.c subproject.c
	    kernel/(
    		build_target.c configure_file.c
    		custom_target.c dependency.c
    		install.c options.c subproject.c
    	)
    	modules/(
    		fs.c keyval.c pkgconfig.c
    		python.c sourceset.c toolchain.c
    	)
    )
    lang/(
    	analyze.c compiler.c eval.c
    	fmt.c func_lookup.c lexer.c
    	object.c object_iterators.c parser.c
    	serial.c string.c typecheck.c
    	vm.c workspace.c
    )
    platform/(
    	assert.c filesystem.c os.c mem.c 
    	path.c run_cmd.c uname.c
    	posix/(
    		filesystem.c init.c log.c
    		os.c path.c rpath_fixer.c
    		run_cmd.c term.c timer.c
    		uname.c
    	)
    )
    external/(
    	libarchive_null.c libcurl_null.c 
    	libpkgconf.c samurai_null.c 
    	tinyjson.c readline_builtin.c
    )
)
libtinyjson.a
$builddir/pkg/libpkgconf/libpkgconf.a
]])

file('bin/muon', '755', '$outdir/muon')

fetch 'git'