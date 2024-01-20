CC = cc
LD = ${CC}

PREFIX = /usr/local
MANDIR = ${PREFIX}/man

CPPFLAGS = -I./libwm
CFLAGS += -Wall -Wextra -pedantic
LDFLAGS += -L./libwm ${LIBS} -static
LIBS = -lwm -lxcb -lXau -lxcb-cursor -lxcb-render -lxcb-render-util -lxcb-image -lxcb-shm -lxcb-util -lxcb-randr
