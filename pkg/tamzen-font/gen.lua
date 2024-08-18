local fonts = {
	'Tamzen10x20b',
	'Tamzen10x20r',
	'Tamzen5x9b',
	'Tamzen5x9r',
	'Tamzen6x12b',
	'Tamzen6x12r',
	'Tamzen7x13b',
	'Tamzen7x13r',
	'Tamzen7x14b',
	'Tamzen7x14r',
	'Tamzen8x15b',
	'Tamzen8x15r',
	'Tamzen8x16b',
	'Tamzen8x16r',
	'TamzenForPowerline10x20b',
	'TamzenForPowerline10x20r',
	'TamzenForPowerline5x9b',
	'TamzenForPowerline5x9r',
	'TamzenForPowerline6x12b',
	'TamzenForPowerline6x12r',
	'TamzenForPowerline7x13b',
	'TamzenForPowerline7x13r',
	'TamzenForPowerline7x14b',
	'TamzenForPowerline7x14r',
	'TamzenForPowerline8x15b',
	'TamzenForPowerline8x15r',
	'TamzenForPowerline8x16b',
	'TamzenForPowerline8x16r',
}

for _, font in ipairs(fonts) do
	local path = ('share/fonts/%s.ttf'):format(font)
	local src = ('$srcdir/ttf/%s.ttf'):format(font)
	file(path, '644', src)
end

fetch 'curl'
