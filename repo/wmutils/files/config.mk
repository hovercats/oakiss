PREFIX = /usr
MANPREFIX = $(PREFIX)/man

CC      = cc
LD      = $(CC)

CFLAGS  = -std=c99 -pedantic -Wall -Os -I/usr/include
LDFLAGS = -static -L/usr/lib -lxcb -lxcb-shm -lxcb-util -lxcb-image -lxcb-render-util -lxcb-render -lxcb-cursor -lXau
