/* Tokyo Night — dmenu 5.4 config */

static int topbar = 1;

static const char *fonts[] = {
    "JetBrainsMono Nerd Font:size=10:antialias=true"
};

static const char *colors[SchemeLast][2] = {
    /*                   fg          bg        */
    [SchemeNorm]     = { "#c0caf5",  "#1a1b26" },
    [SchemeSel]      = { "#c0caf5",  "#364a82" },
    [SchemeOut]      = { "#1a1b26",  "#7aa2f7" },
};

static const char *prompt      = NULL;
static unsigned int lines      = 0;
static const char worddelimiters[] = " M-/";
