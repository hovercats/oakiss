#define ABDUCO_CMD "/bin/sh"
static char KEY_DETACH = CTRL('\\');
static char KEY_REDRAW = 0;
static struct Dir {
	char *path;
	char *env;
	bool personal;
} socket_dirs[] = {
	{ .env  = "ABDUCO_SOCKET_DIR", false },
	{ .env  = "HOME",              true  },
	{ .env  = "TMPDIR",            false },
	{ .path = "/tmp",              false },
};
