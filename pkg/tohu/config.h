#ifndef CONFIG_H
#define CONFIG_H
#include <xkbcommon/xkbcommon-keysyms.h>
#include "types.h"
#include "tohu.h"
static const struct config cfg = {
	.motion_throttle_hz = 85,
	.border_col_active = 0xdeadca7,
	.border_col_normal = 0xff444444,
	.border_width = 3,
	.gaps = 0,
};

static const char* termcmd[] = { "st", NULL };
static const char* menucmd[] = { "dmenu_run", NULL };
static struct bind binds[] = {
	{ SWC_BINDING_KEY,    MOD1,        XKB_KEY_Return, { .v = termcmd }, spawn },
	{ SWC_BINDING_KEY,    MOD1,        XKB_KEY_r,      { .v = menucmd }, spawn },
	{ SWC_BINDING_KEY,    MOD1|SHFT,   XKB_KEY_q,      { .v = NULL },    quit },
	{ SWC_BINDING_KEY,    MOD1,        XKB_KEY_Tab,    { .v = NULL },    focus_next },
	{ SWC_BINDING_KEY,    MOD1,        XKB_KEY_f,      { .v = NULL },    fullscreen },
	{ SWC_BINDING_KEY,    MOD1,        XKB_KEY_q,      { .v = NULL },    kill_sel },
	{ SWC_BINDING_KEY,    MOD1,        XKB_KEY_1,      { .ui = 1 },      workspace_goto },
	{ SWC_BINDING_KEY,    MOD1,        XKB_KEY_2,      { .ui = 2 },      workspace_goto },
	{ SWC_BINDING_KEY,    MOD1,        XKB_KEY_3,      { .ui = 3 },      workspace_goto },
	{ SWC_BINDING_KEY,    MOD1,        XKB_KEY_4,      { .ui = 4 },      workspace_goto },
	{ SWC_BINDING_KEY,    MOD1,        XKB_KEY_5,      { .ui = 5 },      workspace_goto },
	{ SWC_BINDING_KEY,    MOD1,        XKB_KEY_6,      { .ui = 6 },      workspace_goto },
	{ SWC_BINDING_KEY,    MOD1,        XKB_KEY_7,      { .ui = 7 },      workspace_goto },
	{ SWC_BINDING_KEY,    MOD1,        XKB_KEY_8,      { .ui = 8 },      workspace_goto },
	{ SWC_BINDING_KEY,    MOD1,        XKB_KEY_9,      { .ui = 9 },      workspace_goto },
	{ SWC_BINDING_KEY,    MOD1|SHFT,   XKB_KEY_1,      { .ui = 1 },      workspace_moveto },
	{ SWC_BINDING_KEY,    MOD1|SHFT,   XKB_KEY_2,      { .ui = 2 },      workspace_moveto },
	{ SWC_BINDING_KEY,    MOD1|SHFT,   XKB_KEY_3,      { .ui = 3 },      workspace_moveto },
	{ SWC_BINDING_KEY,    MOD1|SHFT,   XKB_KEY_4,      { .ui = 4 },      workspace_moveto },
	{ SWC_BINDING_KEY,    MOD1|SHFT,   XKB_KEY_5,      { .ui = 5 },      workspace_moveto },
	{ SWC_BINDING_KEY,    MOD1|SHFT,   XKB_KEY_6,      { .ui = 6 },      workspace_moveto },
	{ SWC_BINDING_KEY,    MOD1|SHFT,   XKB_KEY_7,      { .ui = 7 },      workspace_moveto },
	{ SWC_BINDING_KEY,    MOD1|SHFT,   XKB_KEY_8,      { .ui = 8 },      workspace_moveto },
	{ SWC_BINDING_KEY,    MOD1|SHFT,   XKB_KEY_9,      { .ui = 9 },      workspace_moveto },
	{ SWC_BINDING_BUTTON, MOD1,        BTN_LEFT,       { .v = NULL },    mouse_move },
	{ SWC_BINDING_BUTTON, MOD1,        BTN_RIGHT,      { .v = NULL },    mouse_resize },
};

#endif /* CONFIG_H */
