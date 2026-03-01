#ifndef CONFIG_H
#define CONFIG_H
static const uint32_t background_color = 0xff777777;
static const uint32_t outer_border_color_inactive = 0xffffffea;
static const uint32_t inner_border_color_inactive = 0xffddbd8c;
static const uint32_t outer_border_color_active = 0xffffffea;
static const uint32_t inner_border_color_active = 0xffc99043;
static const uint32_t outer_border_width = 4;
static const uint32_t inner_border_width = 4;
static const uint32_t select_box_color = 0xffffffff;
static const uint32_t select_box_border = 2;
static const char *const cursor_theme = "nein";
static const char *const select_term_app_id = "st-256color";
static const char *const term = "st";
static const char *const term_flag = "-w";
static const bool enable_terminal_spawning = true;
static const char *const terminal_app_ids[] = {
	"st",
	NULL
};
static const int chord_click_timeout_ms = 250;
static const int32_t move_scroll_edge_threshold = 80;
static const int32_t move_scroll_speed = 16;
static const float move_ease_factor = 0.30f;
static const int timerms = 16;
static const int scrollpx = 64;
static const int scrollease = 4;
static const int scrollcap = 64;
static const bool scroll_drag_mode = true;
static const bool enable_zoom = true;
#define FOCUS_CENTER true
#define JUMP
#endif
