#define _key_lndown	'j' /* move one line down */
#define _key_entrydown	'J' /* move to next link */
#define _key_lnup	'k' /* move one line up */
#define _key_entryup	'K' /* move to previous link */
#define _key_pgdown	' ' /* move one screen down */
#define _key_pgup	'b' /* move one screen up */
#define _key_home	'g' /* move to the top of page */
#define _key_end	'G' /* move to the bottom of page */
#define _key_pgnext	'l' /* view highlighted item */
#define _key_pgprev	'h' /* view previous item */
#define _key_cururi	'U' /* print page uri */
#define _key_seluri	'u' /* print item uri */
#define _key_yankcur	'Y' /* yank page uri */
#define _key_yanksel	'y' /* yank item uri */
#define _key_fetch	'L' /* refetch current item */
#define _key_help	'?' /* display help */
#define _key_quit	'q' /* exit sacc */
#define _key_search	'/' /* search */
#define _key_searchnext	'n' /* search same string forward */
#define _key_searchprev	'N' /* search same string backward */
#ifdef NEED_CONF
static char *yanker = "xclip";
static char *plumber = "xdg-open";
static int modalplumber = 0;
static char tmpdir[] = "/tmp/sacc-XXXXXX";
static char *typestr[] = {
	[TXT] = "Txt+",
	[DIR] = "Dir+",
	[CSO] = "CSO|",
	[ERR] = "Err|",
	[MAC] = "Mac+",
	[DOS] = "DOS+",
	[UUE] = "UUE+",
	[IND] = "Ind+",
	[TLN] = "Tln|",
	[BIN] = "Bin+",
	[MIR] = "Mir+",
	[IBM] = "IBM|",
	[GIF] = "GIF+",
	[IMG] = "Img+",
	[URL] = "URL+",
	[INF] = "   |",
	[UNK] = " ? +",
	[BRK] = "!  |", /* malformed entry */
};
#endif /* NEED_CONF */
