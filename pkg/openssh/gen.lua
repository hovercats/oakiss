local arch = config.target.platform:match('[^-]*')
local archflags = {
	x86_64='-D SANDBOX_SECCOMP_FILTER=1 -D SECCOMP_AUDIT_ARCH=AUDIT_ARCH_X86_64',
	aarch64='-D SANDBOX_SECCOMP_FILTER=1 -D SECCOMP_AUDIT_ARCH=AUDIT_ARCH_AARCH64',
}
cflags{
	'-Wall', '-Wno-pointer-sign', '-Wno-format-truncation', '-Wno-stringop-truncation',
	'-D _XOPEN_SOURCE=600',
	'-D _DEFAULT_SOURCE',
	archflags[arch] or '-D SANDBOX_RLIMIT=1',
	'-I $outdir',
	'-I $srcdir',
	'-isystem $basedir/pkg/openbsd/include',
	'-isystem $builddir/pkg/bearssl/include',
	'-isystem $builddir/pkg/libfido2/include',
	'-isystem $builddir/pkg/linux-headers/include',
	'-isystem $builddir/pkg/zlib/include',
	'-idirafter $srcdir/openbsd-compat',
}

pkg.deps = {
	'pkg/bearssl/headers',
	'pkg/libfido2/headers',
	'pkg/linux-headers/headers',
	'pkg/zlib/headers',
	'$outdir/config.h',
}

build('cat', '$outdir/config.h', {
	'$dir/config.h',
	'$builddir/probe/SIZEOF_LONG',
	'$builddir/probe/SIZEOF_TIME_T',
})

lib('libopenbsd-compat.a', [[openbsd-compat/(
	base64.c basename.c bcrypt_pbkdf.c bindresvport.c blowfish.c daemon.c
	dirname.c explicit_bzero.c fmt_scaled.c freezero.c getcwd.c
	getgrouplist.c getopt_long.c getrrsetbyname.c glob.c inet_aton.c
	inet_ntoa.c inet_ntop.c md5.c memmem.c mktemp.c pwcache.c
	readpassphrase.c reallocarray.c recallocarray.c rresvport.c setenv.c
	setproctitle.c sha1.c sha2.c sigact.c strcasestr.c strlcat.c strlcpy.c
	strmode.c strndup.c strnlen.c strptime.c strsep.c strtoll.c strtonum.c
	strtoull.c strtoul.c timingsafe_bcmp.c vis.c

	arc4random.c bsd-asprintf.c bsd-closefrom.c bsd-cygwin_util.c bsd-err.c
	bsd-flock.c bsd-getpagesize.c bsd-getpeereid.c bsd-malloc.c bsd-misc.c
	bsd-nextstep.c bsd-openpty.c bsd-poll.c bsd-setres_id.c bsd-signal.c
	bsd-snprintf.c bsd-statvfs.c bsd-waitpid.c fake-rfc2553.c
	getrrsetbyname-ldns.c kludge-fd_set.c
	xcrypt.c

	port-aix.c port-irix.c port-linux.c port-solaris.c port-net.c port-uw.c
)]])

-- port-tun.c from openbsd-compat depends on sshbuf-getput-basic.c and ssherr.c
-- from libssh.a, so just include it in libssh.a.
lib('libssh.a', [[
	ssh_api.c
	ssherr.c
	sshbuf.c
	sshkey.c
	sshbuf-getput-basic.c
	sshbuf-misc.c
	krl.c
	bitmap.c

	ssh-xmss.c
	sshkey-xmss.c
	xmss_commons.c
	xmss_fast.c
	xmss_hash.c
	xmss_hash_address.c
	xmss_wots.c

	authfd.c authfile.c
	canohost.c channels.c cipher.c cipher-aes.c cipher-aesctr.c
	cleanup.c
	compat.c fatal.c hostfile.c
	log.c match.c moduli.c nchan.c packet.c
	readpass.c ttymodes.c xmalloc.c addr.c addrmatch.c
	atomicio.c dispatch.c mac.c misc.c utf8.c
	monitor_fdpass.c rijndael.c ssh-ecdsa.c ssh-ecdsa-sk.c
	ssh-ed25519-sk.c ssh-rsa.c dh.c
	msg.c progressmeter.c dns.c entropy.c gss-genr.c umac.c umac128.c
	ssh-pkcs11.c smult_curve25519_ref.c
	poly1305.c chacha.c cipher-chachapoly.c cipher-chachapoly-bearssl.c
	ssh-ed25519.c digest-bearssl.c digest-libc.c
	hmac.c ed25519.c hash.c
	kex.c kex-names.c kexdh.c kexgex.c kexecdh.c kexc25519.c
	kexgexc.c kexgexs.c
	kexsntrup761x25519.c kexmlkem768x25519.c sntrup761.c kexgen.c
	sftp-realpath.c platform-pledge.c platform-tracing.c platform-misc.c
	sshbuf-io.c

	ssh-sk-client.c

	libopenbsd-compat.a
	$builddir/pkg/bearssl/libbearssl.a
	$builddir/pkg/libfido2/libfido2.a.d
	$builddir/pkg/zlib/libz.a
]])

lib('sftp-client.a', [[
	sftp-common.c
	sftp-client.c
	sftp-glob.c
]])

lib('sftp-server.a', [[
	sftp-common.c.o
	sftp-server.c
]])

exe('ssh', [[
	ssh.c readconf.c clientloop.c sshtty.c
	sshconnect.c sshconnect2.c mux.c
	libssh.a.d
]])
file('bin/ssh', '755', '$outdir/ssh')

exe('sshd', [[
	sshd.c
	platform-listen.c
	servconf.c sshpty.c srclimit.c groupaccess.c auth2-methods.c
	libssh.a.d
]])
file('bin/sshd', '755', '$outdir/sshd')

-- used by sshd-session and sshd-auth
lib('sshd-common.a', [[
	auth-rhosts.c auth-passwd.c
	audit.c audit-bsm.c audit-linux.c platform.c
	sshpty.c.o sshlogin.c.o servconf.c.o serverloop.c
	auth.c auth2.c auth2-methods.c.o auth-options.c session.c
	auth2-chall.c groupaccess.c.o
	auth-bsdauth.c auth2-hostbased.c auth2-kbdint.c
	auth2-none.c auth2-passwd.c auth2-pubkey.c auth2-pubkeyfile.c
	monitor_wrap.c auth-krb5.c
	auth2-gss.c gss-serv.c gss-serv-krb5.c
	loginrec.c auth-pam.c auth-shadow.c auth-sia.c
	uidswap.c
]])

exe('sshd-session', [[
	sshd-session.c
	monitor.c platform-listen.c.o
	sshd-common.a
	sftp-server.a
	libssh.a.d
]])
file('libexec/sshd-session', '755', '$outdir/sshd-session')

exe('sshd-auth', [[
	sshd-auth.c
	sandbox-null.c sandbox-rlimit.c sandbox-darwin.c
	sandbox-seccomp-filter.c sandbox-capsicum.c sandbox-solaris.c
	sshd-common.a
	sftp-server.a
	libssh.a.d
]])
file('libexec/sshd-auth', '755', '$outdir/sshd-auth')

exe('scp', {'scp.c', 'sftp-client.a', 'libssh.a.d'})
file('bin/scp', '755', '$outdir/scp')

exe('ssh-add', {'ssh-add.c', 'libssh.a.d'})
file('bin/ssh-add', '755', '$outdir/ssh-add')

exe('ssh-agent', {'ssh-agent.c', 'ssh-pkcs11-client.c', 'libssh.a.d'})
file('bin/ssh-agent', '755', '$outdir/ssh-agent')

exe('ssh-keygen', {'ssh-keygen.c', 'sshsig.c', 'libssh.a.d'})
file('bin/ssh-keygen', '755', '$outdir/ssh-keygen')

exe('ssh-keyscan', {'ssh-keyscan.c', 'libssh.a.d'})
file('bin/ssh-keyscan', '755', '$outdir/ssh-keyscan')

exe('ssh-sk-helper', {'ssh-sk-helper.c', 'ssh-sk.c', 'sk-usbhid.c', 'libssh.a.d'})
file('libexec/ssh-sk-helper', '755', '$outdir/ssh-sk-helper')

exe('sftp-server', {'sftp-server-main.c', 'sftp-server.a', 'libssh.a.d'})
file('libexec/sftp-server', '755', '$outdir/sftp-server')

exe('sftp', {'sftp.c', 'sftp-usergroup.c', 'sftp-client.a', 'libssh.a.d'})
file('bin/sftp', '755', '$outdir/sftp')

man{
	'ssh.1',
	'scp.1',
	'ssh-add.1',
	'ssh-agent.1',
	'ssh-keygen.1',
	'ssh-keyscan.1',
	'ssh_config.5',
	'sshd_config.5',
	'sshd.8',
	'sftp-server.8',
	'sftp.1',
}

fetch 'git'
