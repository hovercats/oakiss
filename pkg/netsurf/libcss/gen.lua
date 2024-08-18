cflags{
	[[-D '_ALIGNED=__attribute__((aligned))']],
	'-I $srcdir/include',
	'-I $srcdir/src',
	'-I $basedir/pkg/netsurf/libparserutils/src/include',
	'-I $basedir/pkg/netsurf/libwapcaplet/src/include',
}

sub('tools.ninja', function()
	toolchain(config.host)
	exe('gen_prop_parser', {'src/parse/properties/css_property_parser_gen.c'})
end)

build('awk', '$outdir/prop_parsers.c', {
	'$srcdir/src/parse/properties/properties.gen',
	'|', '$dir/prop_parsers.awk', '$outdir/gen_prop_parser',
}, {expr='-f $dir/prop_parsers.awk gen_prop_parser=$outdir/gen_prop_parser'})

pkg.deps = {
	'pkg/netsurf/libparserutils/fetch',
	'pkg/netsurf/libwapcaplet/fetch',
}

lib('libcss.a', [[src/(
	stylesheet.c
	charset/detect.c
	lex/lex.c
	parse/(
		parse.c language.c important.c propstrings.c font_face.c mq.c
		properties/(
			azimuth.c
			background.c
			background_position.c
			border.c
			border_color.c
			border_spacing.c
			border_style.c
			border_width.c
			clip.c
			columns.c
			column_rule.c
			content.c
			cue.c
			cursor.c
			elevation.c
			flex.c
			flex_flow.c
			font.c
			font_family.c
			font_weight.c
			list_style.c
			list_style_type.c
			margin.c
			opacity.c
			outline.c
			overflow.c
			padding.c
			pause.c
			play_during.c
			properties.c
			quotes.c
			text_decoration.c
			utils.c
			voice_family.c
		)
	)
	select/(
		arena.c computed.c dispatch.c hash.c select.c font_face.c
		properties/(
			helpers.c
			align_content.c
			align_items.c
			align_self.c
			azimuth.c
			background_attachment.c
			background_color.c
			background_image.c
			background_position.c
			background_repeat.c
			border_bottom_color.c
			border_bottom_style.c
			border_bottom_width.c
			border_collapse.c
			border_left_color.c
			border_left_style.c
			border_left_width.c
			border_right_color.c
			border_right_style.c
			border_right_width.c
			border_spacing.c
			border_top_color.c
			border_top_style.c
			border_top_width.c
			bottom.c
			box_sizing.c
			break_after.c
			break_before.c
			break_inside.c
			caption_side.c
			clear.c
			clip.c
			color.c
			column_count.c
			column_fill.c
			column_gap.c
			column_rule_color.c
			column_rule_style.c
			column_rule_width.c
			column_span.c
			column_width.c
			content.c
			counter_increment.c
			counter_reset.c
			cue_after.c
			cue_before.c
			cursor.c
			direction.c
			display.c
			elevation.c
			empty_cells.c
			flex_basis.c
			flex_direction.c
			flex_grow.c
			flex_shrink.c
			flex_wrap.c
			float.c
			font_family.c
			font_size.c
			font_style.c
			font_variant.c
			font_weight.c
			height.c
			justify_content.c
			left.c
			letter_spacing.c
			line_height.c
			list_style_image.c
			list_style_position.c
			list_style_type.c
			margin_bottom.c
			margin_left.c
			margin_right.c
			margin_top.c
			max_height.c
			max_width.c
			min_height.c
			min_width.c
			opacity.c
			order.c
			orphans.c
			outline_color.c
			outline_style.c
			outline_width.c
			overflow_x.c
			overflow_y.c
			padding_bottom.c
			padding_left.c
			padding_right.c
			padding_top.c
			page_break_after.c
			page_break_before.c
			page_break_inside.c
			pause_after.c
			pause_before.c
			pitch.c
			pitch_range.c
			play_during.c
			position.c
			quotes.c
			richness.c
			right.c
			speech_rate.c
			speak.c
			speak_header.c
			speak_numeral.c
			speak_punctuation.c
			stress.c
			table_layout.c
			text_align.c
			text_decoration.c
			text_indent.c
			text_transform.c
			top.c
			unicode_bidi.c
			vertical_align.c
			visibility.c
			voice_family.c
			volume.c
			white_space.c
			widows.c
			width.c
			word_spacing.c
			writing_mode.c
			z_index.c
		)
	)
	utils/(errors.c utils.c)
) $builddir/pkg/netsurf/(
	libcss/prop_parsers.c
	libparserutils/libparserutils.a
	libwapcaplet/libwapcaplet.a
)]])

fetch 'git'
