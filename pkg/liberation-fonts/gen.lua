local fonts = {
	'LiberationMono-Bold',
	'LiberationMono-BoldItalic',
	'LiberationMono-Italic',
	'LiberationMono-Regular',
	'LiberationSans-Bold',
	'LiberationSans-BoldItalic',
	'LiberationSans-Italic',
	'LiberationSans-Regular',
	'LiberationSerif-Bold',
	'LiberationSerif-BoldItalic',
	'LiberationSerif-Italic',
	'LiberationSerif-Regular',
}

for _, font in ipairs(fonts) do
	local path = ('share/fonts/%s.ttf'):format(font)
	local src = ('$srcdir/%s.ttf'):format(font)
	file(path, '644', src)
end

fetch 'curl'
