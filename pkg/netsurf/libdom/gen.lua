cflags{
	'-I $srcdir/include',
	'-I $srcdir/src',
	'-I $basedir/pkg/netsurf/libhubbub/src/include',
	'-I $basedir/pkg/netsurf/libparserutils/src/include',
	'-I $basedir/pkg/netsurf/libwapcaplet/src/include',
	'-isystem $builddir/pkg/expat/include',
}

pkg.hdrs = copy('$outdir/include/dom', '$srcdir', {
	'bindings/hubbub/errors.h',
	'bindings/hubbub/parser.h',
	'bindings/xml/xmlerror.h',
	'bindings/xml/xmlparser.h',
})
pkg.deps = {
	'pkg/expat/headers',
	'pkg/netsurf/libhubbub/fetch',
	'pkg/netsurf/libparserutils/fetch',
	'pkg/netsurf/libwapcaplet/fetch',
}

lib('libdom.a', [[
	src/(
		core/(
			string.c node.c
			attr.c characterdata.c element.c
			implementation.c
			text.c typeinfo.c comment.c
			namednodemap.c nodelist.c
			cdatasection.c document_type.c entity_ref.c pi.c
			doc_fragment.c document.c
		)
		events/(
			event.c dispatch.c event_target.c document_event.c
			custom_event.c keyboard_event.c mouse_wheel_event.c
			text_event.c event_listener.c mouse_event.c mutation_event.c
			ui_event.c mouse_multi_wheel_event.c mutation_name_event.c
		)
		html/(
			html_applet_element.c
			html_area_element.c
			html_anchor_element.c
			html_basefont_element.c
			html_base_element.c
			html_body_element.c
			html_button_element.c
			html_canvas_element.c
			html_collection.c
			html_document.c
			html_element.c
			html_dlist_element.c
			html_directory_element.c
			html_options_collection.c
			html_html_element.c
			html_head_element.c
			html_link_element.c
			html_title_element.c
			html_meta_element.c
			html_style_element.c
			html_form_element.c
			html_select_element.c
			html_input_element.c
			html_text_area_element.c
			html_opt_group_element.c
			html_option_element.c
			html_hr_element.c
			html_menu_element.c
			html_fieldset_element.c
			html_legend_element.c
			html_div_element.c
			html_paragraph_element.c
			html_heading_element.c
			html_quote_element.c
			html_pre_element.c
			html_br_element.c
			html_label_element.c
			html_ulist_element.c
			html_olist_element.c
			html_li_element.c
			html_font_element.c
			html_mod_element.c
			html_image_element.c
			html_object_element.c
			html_param_element.c
			html_map_element.c
			html_script_element.c
			html_tablecaption_element.c
			html_tablecell_element.c
			html_tablecol_element.c
			html_tablesection_element.c
			html_table_element.c
			html_tablerow_element.c
			html_frameset_element.c
			html_frame_element.c
			html_iframe_element.c
			html_isindex_element.c
		)
		utils/(namespace.c hashtable.c character_valid.c validate.c)
	)
	bindings/hubbub/parser.c
	bindings/xml/expat_xmlparser.c
	$builddir/pkg/expat/libexpat.a.d
	$builddir/pkg/netsurf/libhubbub/libhubbub.a.d
	$builddir/pkg/netsurf/libwapcaplet/libwapcaplet.a
]])

fetch 'git'
