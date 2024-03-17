cflags{
	'-std=c99', '-Wall', '-Wpedantic', '-Wno-maybe-uninitialized',
	'-I $dir',
	[[-D 'ZIC_BLOAT_DEFAULT="slim"']],
}

exe('zic', {'zic.c'})
file('bin/zic', '755', '$outdir/zic')
man{'zic.8'}

local srcs = {
	'africa',
	'antarctica',
	'asia',
	'australasia',
	'europe',
	'northamerica',
	'southamerica',
	'etcetera',
	'factory',
}

local zones = {}
local data = load 'data.lua'
for _, src in ipairs(srcs) do
	for _, name, target in sortedpairs(data[src]) do
		if target then
			target = name:gsub('[^/]+', '..'):sub(1, -3)..target
			sym('share/zoneinfo/'..name, target)
		else
			file('share/zoneinfo/'..name, '644', '$outdir/zoneinfo/'..name)
			table.insert(zones, name)
		end
	end
end

rule('zic', 'zic -d $outdir/zoneinfo $in')
build('zic', expand{'$outdir/zoneinfo/', zones}, expand{'$srcdir/', srcs})

fetch 'git'
