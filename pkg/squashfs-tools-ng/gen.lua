cflags{
	'-std=c99', '-Wall', '-Wpedantic',
	'-Wno-discarded-qualifiers',
	'-D _GNU_SOURCE',
	'-I $srcdir',
	'-I $srcdir/include',
	'-I $dir',
}

pkg.deps = {}

local cfg = {}
for line in iterlines('config.h', 1) do
	local var = line:match('^#define (WITH_[%w_]+)')
	if var then
		cfg[var] = true
	end
end

local srcs = paths[[
	lib/sqfs/(
		id_table.c super.c
		readdir.c xattr/xattr.c
		write_table.c meta_writer.c
		read_super.c meta_reader.c
		read_inode.c write_inode.c
		dir_writer.c xattr/xattr_reader.c
		read_table.c comp/compressor.c
		dir_reader.c read_tree.c
		inode.c xattr/xattr_writer.c
		xattr/xattr_writer_flush.c
		xattr/xattr_writer_record.c
		write_super.c data_reader.c
		block_processor/frontend.c
		block_processor/block_processor.c
		block_processor/backend.c
		frag_table.c
		block_writer.c
		misc.c

		unix/io_file.c
	)
	lib/util/threadpool.c
	libutil.a
]]

if cfg.WITH_GZIP then
	cflags{'-isystem $builddir/pkg/zlib/include'}
	table.insert(pkg.deps, 'pkg/zlib/headers')
	table.insert(srcs, {
		'lib/sqfs/comp/gzip.c',
		'$builddir/pkg/zlib/libz.a',
	})
end

if cfg.WITH_ZSTD then
	cflags{'-isystem $builddir/pkg/zstd/include'}
	table.insert(pkg.deps, 'pkg/zstd/headers')
	table.insert(srcs, {
		'lib/sqfs/comp/zstd.c',
		'$builddir/pkg/zstd/libzstd.a',
	})
end

lib('libsquashfs.a', srcs)

lib('libcommon.a', [[
	lib/common/(
		inode_stat.c hardlink.c
		print_version.c data_reader_dump.c
		compress.c comp_opt.c
		data_writer.c
		get_path.c data_writer_ostream.c
		perror.c
		mkdir_p.c parse_size.c
		print_size.c
		writer/(
			init.c cleanup.c
			serialize_fstree.c
			finish.c
		)
	)
	libsquashfs.a.d
	libfstream.a
	libfstree.a.d
]])

lib('libfstream.a', [[
	lib/fstream/(
		ostream.c printf.c
		istream.c get_line.c
		compressor.c
		compress/(
			ostream_compressor.c
			gzip.c
			zstd.c
		)
		uncompress/(
			istream_compressor.c
			autodetect.c
			gzip.c
			zstd.c
		)
		unix/(ostream.c istream.c)
	)
]])

lib('libfstree.a', [[
	lib/fstree/(
		fstree.c fstree_from_file.c
		fstree_sort.c hardlink.c
		post_process.c get_path.c
		mknode.c fstree_from_dir.c
		add_by_path.c get_by_path.c
		source_date_epoch.c
		canonicalize_name.c
		filename_sane.c
	)
	libfstream.a
]])

lib('libtar.a', [[
	lib/tar/(
		read_header.c write_header.c
		number.c checksum.c cleanup.c
		read_sparse_map.c read_sparse_map_old.c
		base64.c urldecode.c
		padd_file.c record_to_memory.c
		pax_header.c read_sparse_map_new.c
	)
]])

lib('libutil.a', [[
	lib/util/(
		str_table.c alloc.c
		rbtree.c
		array.c
		xxhash.c hash_table.c
		threadpool_serial.c
		is_memory_zero.c
	)
]])

exe('gensquashfs', [[
	bin/gensquashfs/(mkfs.c options.c selinux.c dirscan_xattr.c)
	libcommon.a.d
]])
file('bin/gensquashfs', '755', '$outdir/gensquashfs')
man{'bin/gensquashfs/gensquashfs.1'}

exe('rdsquashfs', [[
	bin/rdsquashfs/(
		rdsquashfs.c
		list_files.c options.c
		restore_fstree.c describe.c
		fill_files.c dump_xattrs.c
		stat.c
	)
	libcommon.a.d
]])
file('bin/rdsquashfs', '755', '$outdir/rdsquashfs')
man{'bin/rdsquashfs/rdsquashfs.1'}

exe('sqfsdiff', [[
	bin/sqfsdiff/(
		sqfsdiff.c
		util.c options.c
		compare_dir.c node_compare.c
		compare_files.c super.c
		extract.c
	)
	libcommon.a.d
]])
file('bin/sqfsdiff', '755', '$outdir/sqfsdiff')
man{'bin/sqfsdiff/sqfsdiff.1'}

exe('sqfs2tar', [[
	bin/sqfs2tar/(sqfs2tar.c options.c write_tree.c xattr.c)
	libcommon.a.d libtar.a
]])
file('bin/sqfs2tar', '755', '$outdir/sqfs2tar')
man{'bin/sqfs2tar/sqfs2tar.1'}

exe('tar2sqfs', [[
	bin/tar2sqfs/(tar2sqfs.c options.c process_tarball.c)
	libcommon.a.d libtar.a
]])
file('bin/tar2sqfs', '755', '$outdir/tar2sqfs')
man{'bin/tar2sqfs/tar2sqfs.1'}

fetch 'git'
