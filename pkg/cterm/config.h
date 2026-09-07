#ifndef CONFIG_H
#define CONFIG_H

#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

static const char font_path[] = "/share/fonts/terminus/ter-u12n.bdf";

static const int   win_width = 70;  /* in columns */
static const int   win_height = 25; /* in rows */
static const char  win_title[] = "cterm";
static const int   win_fps = 60;

static const int   pad_x = 8;
static const int   pad_y = 8;

static const char* const shell = "/bin/sh"; /* NULL uses $SHELL */
static const char term_name[] = "vt100";

#define CTRL_DOWN  (win->key_syms[MAUS_KEY_CONTROL_L] || win->key_syms[MAUS_KEY_CONTROL_R])
#define SHIFT_DOWN (win->key_syms[MAUS_KEY_SHIFT_L] || win->key_syms[MAUS_KEY_SHIFT_R])

#define BIND_COPY  (CTRL_DOWN && SHIFT_DOWN && \
                   (ev->key.key == MAUS_KEY_C || ev->key.key == MAUS_KEY_C_UP))

#define BIND_PASTE (CTRL_DOWN && SHIFT_DOWN && \
                   (ev->key.key == MAUS_KEY_V || ev->key.key == MAUS_KEY_V_UP))

#define BIND_RELOAD_FONT (win->key_syms[MAUS_KEY_ALT_R] && \
                         (ev->key.key == MAUS_KEY_R ||     \
                         ev->key.key == MAUS_KEY_R_UP))

/* AARRGGBB */
static const uint32_t default_fg = 0xccccc6;
static const uint32_t default_bg = 0x1d1d1d;
static const uint32_t cursor_fg  = 0xff000000;
static const uint32_t cursor_bg  = 0xffffffff;

static const uint32_t color_table[16] = {
	0x1d1d1d, /* black */
	0x755a5b, /* red */
	0x68755a, /* green */
	0x756e5a, /* yellow */
	0x5b6976, /* blue */
	0x755b76, /* magenta */
	0x465457, /* cyan */
	0xccccc6, /* white */

	0x5a5b5c, /* bright black */
	0xa37679, /* bright red */
	0x87a376, /* bright green */
	0xa39b76, /* bright yellow */
	0x758ba3, /* bright blue */
	0x9f76a3, /* bright magenta */
	0x899ca1, /* bright cyan */
	0xf8f8f2, /* bright white */
};

#endif /* CONFIG_H */

