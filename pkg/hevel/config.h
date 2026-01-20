#define USE_IMAGE true
#ifdef USE_IMAGE
	static char* imgpath = "/home/wololo/usr/img/wallhaven-yx357x.png";
#endif 
static const uint32_t background_color = 0xff787878;
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
static const bool scroll_drag_mode = false;
static const bool focus_center = true;
static const bool enable_zoom = false;
#define STICKY
