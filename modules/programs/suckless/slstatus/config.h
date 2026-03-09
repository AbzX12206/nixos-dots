/* slstatus 1.1 config — laptop */

#define MAXLEN 2048

static const char unknown_str[] = "n/a";
const unsigned int interval = 2000;

static const struct arg args[] = {
    /* CPU */
    { cpu_perc,    "CPU: %s%%  ",   NULL   },

    /* RAM */
    { ram_used,    "RAM: %s",       NULL   },
    { ram_total,   "/%s  ",         NULL   },

    /* WiFi — SSID or "no" */
    { run_command, "WiFi: %s  ",
      "nmcli -t -f active,ssid dev wifi 2>/dev/null "
      "| grep '^yes' | cut -d: -f2 | head -1 | grep . || echo no" },

    /* Battery */
    { battery_perc,  "BAT: %s%%",  "BAT0" },
    { run_command,   "%s  ",
      "cat /sys/class/power_supply/BAT0/status 2>/dev/null "
      "| grep -q Charging && echo + || echo ''" },

    /* Volume */
    { vol_perc,    "VOL: %s%%  ",   "/dev/mixer" },

    /* Date + time */
    { datetime,    "%s",            "%a %d %b  %H:%M" },
};
