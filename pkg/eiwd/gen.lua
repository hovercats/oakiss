cflags{
	'-D HAVE_CONFIG_H',
	'-I $outdir',
	'-I $srcdir',
	'-isystem $builddir/pkg/linux-headers/include',
}

build('copy', '$outdir/ell/ell.h', '$dir/ell.h')
build('copy', '$outdir/config.h', '$dir/config.h')

pkg.deps = {
	'$outdir/ell/ell.h',
	'$outdir/config.h',
	'pkg/linux-headers/headers',
}

lib('libell-internal.a', [[
	ell/(
		util.c test.c strv.c
		utf8.c queue.c hashmap.c
		string.c settings.c main.c
		idle.c signal.c timeout.c
		io.c ringbuf.c log.c
		checksum.c netlink.c genl.c
		rtnl.c dbus.c dbus-message.c
		dbus-util.c dbus-service.c
		dbus-client.c dbus-name-cache.c
		dbus-filter.c gvariant-util.c
		siphash.c hwdb.c cipher.c random.c
		uintset.c base64.c pem.c tls.c
		tls-record.c tls-suites.c
		tls-extensions.c uuid.c
		key.c file.c dir.c net.c
		dhcp.c dhcp-transport.c
		dhcp-lease.c dhcp-util.c
		dhcp-server.c cert.c cert-crypto.c
		ecc-external.c ecc.c ecdh.c time.c
		path.c dhcp6.c icmp6.c dhcp6-lease.c
		dhcp6-transport.c acd.c netconfig.c
		sysctl.c
	)
]])

exe('iwd', [[
	src/(
		main.c netdev.c wiphy.c
		device.c station.c ie.c
		dbus.c mpdu.c eapol.c
		eapolutil.c handshake.c scan.c
		common.c agent.c storage.c
		network.c wsc.c backtrace.c
		knownnetworks.c rfkill.c
		ft.c ap.c adhoc.c sae.c
		nl80211util.c nl80211cmd.c
		owe.c blacklist.c manager.c
		erp.c fils.c anqp.c anqputil.c
		netconfig.c netconfig-commit.c
		resolve.c hotspot.c p2p.c
		p2putil.c module.c rrm.c
		frame-xchg.c eap-wsc.c
		wscutil.c diagnostic.c
		ip-pool.c band.c
		sysfs.c offchannel.c
		dpp-util.c json.c dpp.c

		eap.c eap-md5.c eap-tls.c
		eap-ttls.c eap-mschapv2.c
		eap-sim.c eap-aka.c eap-peap.c
		eap-gtc.c eap-pwd.c util.c
		crypto.c simutil.c simauth.c
		watchlist.c eap-tls-common.c
		mschaputil.c

		ofono.c
	)
		libell-internal.a
]])

file('bin/iwd', '755', '$outdir/iwd')
file('bin/iwd_passphrase', '755', '$dir/iwd_passphrase')
man{'src/iwd.8'}

fetch 'curl'
