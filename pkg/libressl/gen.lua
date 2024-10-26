cflags{
	'-Wundef', '-Wno-attributes',
	'-D LIBRESSL_INTERNAL',
	'-D OPENSSL_NO_HW_PADLOCK',
	'-D OPENSSL_NO_ASM',
	'-D __BEGIN_HIDDEN_DECLS=',
	'-D __END_HIDDEN_DECLS=',
	[[-D '__warn_references(sym,msg)=_Static_assert(1, "")']],
	'-I $srcdir/include',
	'-I $srcdir/crypto',
	'-I $srcdir/crypto/asn1',
	'-I $srcdir/crypto/bn',
	'-I $srcdir/crypto/ec',
	'-I $srcdir/crypto/ecdh',
	'-I $srcdir/crypto/ecdsa',
	'-I $srcdir/crypto/evp',
	'-I $srcdir/crypto/modes',
	'-I $basedir/pkg/openbsd/include',
	'-idirafter $srcdir/include/compat',
}

pkg.hdrs = {
	copy('$outdir/include/openssl', '$srcdir/include/openssl', {
		'aes.h',
		'asn1.h',
		'asn1t.h',
		'blowfish.h',
		'bio.h',
		'bn.h',
		'buffer.h',
		'camellia.h',
		'cast.h',
		'chacha.h',
		'cmac.h',
		'cms.h',
		'comp.h',
		'conf.h',
		'conf_api.h',
		'crypto.h',
		'curve25519.h',
		'des.h',
		'dh.h',
		'dsa.h',
		'dso.h',
		'ec.h',
		'ecdh.h',
		'ecdsa.h',
		'engine.h',
		'err.h',
		'evp.h',
		'gost.h',
		'hmac.h',
		'idea.h',
		'lhash.h',
		'md4.h',
		'md5.h',
		'modes.h',
		'objects.h',
		'ocsp.h',
		'opensslfeatures.h',
		'opensslv.h',
		'ossl_typ.h',
		'pem.h',
		'pem2.h',
		'pkcs12.h',
		'pkcs7.h',
		'poly1305.h',
		'rand.h',
		'rc2.h',
		'rc4.h',
		'ripemd.h',
		'rsa.h',
		'sha.h',
		'sm3.h',
		'sm4.h',
		'safestack.h',
		'stack.h',
		'ts.h',
		'txt_db.h',
		'ui.h',
		'ui_compat.h',
		'whrlpool.h',
		'x509.h',
		'x509_vfy.h',
		'x509_verify.h',
		'x509v3.h',

		'opensslconf.h',
		'obj_mac.h',

		'srtp.h',
		'ssl.h',
		'ssl2.h',
		'ssl3.h',
		'ssl23.h',
		'tls1.h',
		'dtls1.h',
	}),
	install=true,
}

-- src/crypto/Makefile.am
lib('libcrypto.a', [[crypto/(
	cryptlib.c malloc-wrapper.c mem_dbg.c cversion.c ex_data.c cpt_err.c
	o_time.c o_str.c o_init.c
	mem_clr.c crypto_init.c crypto_lock.c
	aes/(
		aes_misc.c aes_ecb.c aes_cfb.c aes_ofb.c
		aes_ctr.c aes_ige.c aes_wrap.c
	)
	asn1/(
		a_object.c a_bitstr.c a_time.c a_int.c a_octet.c
		a_print.c a_type.c a_dup.c a_d2i_fp.c a_i2d_fp.c
		a_enum.c a_utf8.c a_sign.c a_digest.c a_verify.c a_mbstr.c a_strex.c
		x_algor.c x_val.c x_pubkey.c x_sig.c x_req.c x_attrib.c x_bignum.c
		x_long.c x_name.c x_x509.c x_x509a.c x_crl.c x_info.c x_spki.c nsseq.c
		x_nx509.c d2i_pu.c d2i_pr.c i2d_pu.c i2d_pr.c
		t_req.c t_x509.c t_x509a.c t_crl.c t_pkey.c t_spki.c t_bitst.c
		tasn_new.c tasn_fre.c tasn_enc.c tasn_dec.c tasn_utl.c tasn_typ.c
		tasn_prn.c ameth_lib.c
		f_int.c f_string.c n_pkey.c
		f_enum.c x_pkey.c a_bool.c x_exten.c bio_asn1.c bio_ndef.c asn_mime.c
		asn1_gen.c asn1_par.c asn1_lib.c asn1_err.c a_strnid.c
		evp_asn1.c asn_pack.c p5_pbe.c p5_pbev2.c p8_pkey.c asn_moid.c
		a_time_tm.c
	)
	bf/(bf_skey.c bf_ecb.c bf_cfb64.c bf_ofb64.c)
	bio/(
		bio_lib.c bio_cb.c bio_err.c bio_meth.c
		bss_mem.c bss_null.c bss_fd.c
		bss_file.c bss_sock.c bss_conn.c
		bf_null.c bf_buff.c b_print.c b_dump.c
		b_posix.c b_sock.c bss_acpt.c bf_nbio.c bss_log.c bss_bio.c
		bss_dgram.c
	)
	bn/(
		bn_add.c bn_div.c bn_exp.c bn_lib.c bn_ctx.c bn_mul.c bn_mod.c
		bn_print.c bn_rand.c bn_shift.c bn_word.c bn_blind.c
		bn_kron.c bn_sqrt.c bn_gcd.c bn_prime.c bn_err.c bn_sqr.c
		bn_recp.c bn_mont.c bn_mpi.c bn_exp2.c bn_gf2m.c bn_nist.c
		bn_depr.c bn_const.c bn_x931p.c
	)
	buffer/(buffer.c buf_err.c buf_str.c)
	camellia/(cmll_cfb.c cmll_ctr.c cmll_ecb.c cmll_ofb.c)
	cast/(c_skey.c c_ecb.c c_enc.c c_cfb64.c c_ofb64.c)
	chacha/chacha.c
	cmac/(cmac.c cm_ameth.c cm_pmeth.c)
	cms/(
		cms_asn1.c cms_att.c cms_cd.c cms_dd.c cms_enc.c cms_env.c cms_err.c
		cms_ess.c cms_io.c cms_kari.c cms_lib.c cms_pwri.c cms_sd.c
		cms_smime.c
	)
	comp/(comp_lib.c comp_err.c c_rle.c c_zlib.c)
	conf/(
		conf_err.c conf_lib.c conf_api.c conf_def.c conf_mod.c
		conf_mall.c conf_sap.c
	)
	curve25519/(curve25519.c curve25519-generic.c)
	des/(
		cbc_cksm.c cbc_enc.c cfb64enc.c cfb_enc.c
		ecb3_enc.c ecb_enc.c  enc_read.c enc_writ.c
		fcrypt.c ofb64enc.c ofb_enc.c  pcbc_enc.c
		qud_cksm.c rand_key.c set_key.c xcbc_enc.c
		str2key.c  cfb64ede.c ofb64ede.c ede_cbcm_enc.c
	)
	dh/(
		dh_asn1.c dh_gen.c dh_key.c dh_lib.c dh_check.c dh_err.c dh_depr.c
		dh_ameth.c dh_pmeth.c dh_prn.c
	)
	dsa/(
		dsa_gen.c dsa_key.c dsa_lib.c dsa_asn1.c dsa_vrf.c dsa_sign.c
		dsa_err.c dsa_ossl.c dsa_depr.c dsa_ameth.c dsa_pmeth.c dsa_prn.c
		dsa_meth.c
	)
	dso/(
		dso_dlfcn.c dso_err.c dso_lib.c dso_null.c
		dso_openssl.c
	)
	ec/(
		ec_lib.c ecp_smpl.c ecp_mont.c ecp_nist.c ec_cvt.c ec_mult.c
		ec_err.c ec_curve.c ec_check.c ec_print.c ec_asn1.c ec_key.c
		ec2_smpl.c ec2_mult.c ec_ameth.c ec_pmeth.c ec_kmeth.c eck_prn.c
		ecp_oct.c ec2_oct.c ec_oct.c
	)
	ecdh/(ech_lib.c ech_key.c ech_err.c ecdh_kdf.c)
	ecdsa/(ecs_lib.c ecs_asn1.c ecs_ossl.c ecs_sign.c ecs_vrf.c ecs_err.c)
	engine/(
		eng_err.c eng_lib.c eng_list.c eng_init.c eng_ctrl.c
		eng_table.c eng_pkey.c eng_fat.c eng_all.c
		tb_rsa.c tb_dsa.c tb_ecdsa.c tb_dh.c tb_ecdh.c tb_rand.c tb_store.c
		tb_cipher.c tb_digest.c tb_pkmeth.c tb_asnmth.c tb_eckey.c
		eng_openssl.c eng_cnf.c eng_dyn.c
	)
	err/(err.c err_all.c err_prn.c)
	evp/(
		encode.c digest.c evp_enc.c evp_key.c
		e_des.c e_bf.c e_idea.c e_des3.c e_camellia.c
		e_rc4.c e_aes.c names.c
		e_xcbc_d.c e_rc2.c e_cast.c
		m_null.c m_md4.c m_md5.c m_sha1.c m_sm3.c m_wp.c
		m_dss.c m_dss1.c m_ripemd.c m_ecdsa.c
		p_open.c p_seal.c p_sign.c p_verify.c p_lib.c p_enc.c p_dec.c
		bio_md.c bio_b64.c bio_enc.c evp_err.c e_null.c
		c_all.c evp_lib.c
		evp_pkey.c evp_pbe.c p5_crpt.c p5_crpt2.c
		e_old.c pmeth_lib.c pmeth_fn.c pmeth_gn.c m_sigver.c
		e_aes_cbc_hmac_sha1.c e_rc4_hmac_md5.c
		e_chacha.c evp_aead.c e_chacha20poly1305.c
		e_gost2814789.c m_gost2814789.c m_gostr341194.c m_streebog.c
		e_sm4.c
		m_md5_sha1.c
	)
	gost/(
		gost2814789.c gost89_keywrap.c gost89_params.c gost89imit_ameth.c
		gost89imit_pmeth.c gost_asn1.c gost_err.c gostr341001.c
		gostr341001_ameth.c gostr341001_key.c gostr341001_params.c
		gostr341001_pmeth.c gostr341194.c streebog.c
	)
	hkdf/hkdf.c
	hmac/(hmac.c hm_ameth.c hm_pmeth.c)
	idea/(i_cbc.c i_cfb64.c i_ofb64.c i_ecb.c i_skey.c)
	lhash/(lhash.c lh_stats.c)
	md4/(md4_dgst.c md4_one.c)
	md5/(md5_dgst.c md5_one.c)
	modes/(cbc128.c ctr128.c cts128.c cfb128.c ofb128.c gcm128.c ccm128.c xts128.c)
	objects/(o_names.c obj_dat.c obj_lib.c obj_err.c obj_xref.c)
	ocsp/(
		ocsp_asn.c ocsp_ext.c ocsp_ht.c ocsp_lib.c ocsp_cl.c
		ocsp_srv.c ocsp_prn.c ocsp_vfy.c ocsp_err.c
	)
	pem/(
		pem_sign.c pem_seal.c pem_info.c pem_lib.c pem_all.c pem_err.c
		pem_x509.c pem_xaux.c pem_oth.c pem_pk8.c pem_pkey.c pvkfmt.c
	)
	pkcs12/(
		p12_add.c p12_asn.c p12_attr.c p12_crpt.c p12_crt.c p12_decr.c
		p12_init.c p12_key.c p12_kiss.c p12_mutl.c
		p12_utl.c p12_npas.c pk12err.c p12_p8d.c p12_p8e.c
	)
	pkcs7/(
		pk7_asn1.c pk7_lib.c pkcs7err.c pk7_doit.c pk7_smime.c pk7_attr.c
		pk7_mime.c bio_pk7.c
	)
	poly1305/poly1305.c
	rand/(randfile.c rand_lib.c rand_err.c)
	rc2/(rc2_ecb.c rc2_skey.c rc2_cbc.c rc2cfb64.c rc2ofb64.c)
	ripemd/(rmd_dgst.c rmd_one.c)
	rsa/(
		rsa_eay.c rsa_gen.c rsa_lib.c rsa_sign.c rsa_saos.c rsa_err.c
		rsa_pk1.c rsa_none.c rsa_oaep.c rsa_chk.c
		rsa_pss.c rsa_x931.c rsa_asn1.c rsa_depr.c rsa_ameth.c rsa_prn.c
		rsa_pmeth.c rsa_crpt.c rsa_meth.c
	)
	sha/(sha1dgst.c sha1_one.c sha256.c sha512.c)
	sm3/sm3.c
	sm4/sm4.c
	stack/stack.c
	ts/(
		ts_err.c ts_req_utils.c ts_req_print.c ts_rsp_utils.c ts_rsp_print.c
		ts_rsp_sign.c ts_rsp_verify.c ts_verify_ctx.c ts_lib.c ts_conf.c
		ts_asn1.c
	)
	txt_db/txt_db.c
	ui/(ui_err.c ui_lib.c ui_openssl.c ui_util.c)
	whrlpool/wp_dgst.c
	x509/(
		x509_addr.c x509_asid.c
		x509_def.c x509_d2.c x509_r2x.c x509_cmp.c
		x509_obj.c x509_req.c x509spki.c x509_vfy.c
		x509_set.c x509cset.c x509rset.c x509_err.c
		x509name.c x509_v3.c x509_ext.c x509_att.c
		x509type.c x509_lu.c x_all.c x509_txt.c
		x509_trs.c by_file.c by_dir.c by_mem.c x509_vpm.c

		x509_bcons.c x509_bitst.c x509_conf.c x509_extku.c x509_ia5.c x509_lib.c
		x509_prn.c x509_utl.c x509_genn.c x509_alt.c x509_skey.c x509_akey.c x509_pku.c
		x509_int.c x509_enum.c x509_sxnet.c x509_cpols.c x509_crld.c x509_purp.c x509_info.c
		x509_ocsp.c x509_akeya.c x509_pmaps.c x509_pcons.c x509_ncons.c x509_pcia.c x509_pci.c
		x509_issuer_cache.c x509_constraints.c x509_verify.c
		pcy_cache.c pcy_node.c pcy_data.c pcy_map.c pcy_tree.c pcy_lib.c
	)

	aes/(aes_core.c aes_cbc.c)
	bf/bf_enc.c
	bn/bn_asm.c
	camellia/(camellia.c cmll_cbc.c cmll_misc.c)
	des/(des_enc.c fcrypt_b.c)
	rc4/(rc4_enc.c rc4_skey.c)
	whrlpool/wp_block.c
) $builddir/pkg/openbsd/libbsd.a.d]])
file('lib/libcrypto.a', '644', '$outdir/libcrypto.a')

-- src/ssl/Makefile.am
lib('libssl.a', [[ssl/(
	bio_ssl.c
	bs_ber.c
	bs_cbb.c
	bs_cbs.c
	d1_both.c
	d1_lib.c
	d1_pkt.c
	d1_srtp.c
	pqueue.c
	s3_cbc.c
	s3_lib.c
	ssl_algs.c
	ssl_asn1.c
	ssl_both.c
	ssl_cert.c
	ssl_ciph.c
	ssl_ciphers.c
	ssl_clnt.c
	ssl_err.c
	ssl_init.c
	ssl_kex.c
	ssl_lib.c
	ssl_methods.c
	ssl_packet.c
	ssl_pkt.c
	ssl_rsa.c
	ssl_sess.c
	ssl_sigalgs.c
	ssl_srvr.c
	ssl_stat.c
	ssl_tlsext.c
	ssl_transcript.c
	ssl_txt.c
	ssl_versions.c
	t1_enc.c
	t1_lib.c
	tls12_key_schedule.c
	tls12_lib.c
	tls12_record_layer.c
	tls13_buffer.c
	tls13_client.c
	tls13_error.c
	tls13_handshake.c
	tls13_handshake_msg.c
	tls13_key_schedule.c
	tls13_key_share.c
	tls13_legacy.c
	tls13_lib.c
	tls13_record.c
	tls13_record_layer.c
	tls13_server.c
	tls_content.c
) libcrypto.a.d]])
file('lib/libssl.a', '644', '$outdir/libssl.a')

exe('openssl', [[apps/openssl/(
	apps.c apps_posix.c asn1pars.c ca.c certhash.c ciphers.c cms.c crl.c
	crl2p7.c dgst.c dh.c dhparam.c dsa.c dsaparam.c ec.c ecparam.c enc.c
	errstr.c gendh.c gendsa.c genpkey.c genrsa.c nseq.c ocsp.c
	openssl.c passwd.c pkcs12.c pkcs7.c pkcs8.c pkey.c pkeyparam.c
	pkeyutl.c prime.c rand.c req.c rsa.c rsautl.c s_cb.c s_client.c
	s_server.c s_socket.c s_time.c sess_id.c smime.c speed.c spkac.c ts.c
	verify.c version.c x509.c
) libssl.a.d libcrypto.a.d]])
file('bin/openssl', '755', '$outdir/openssl')
man{'apps/openssl/openssl.1'}

fetch 'curl'
