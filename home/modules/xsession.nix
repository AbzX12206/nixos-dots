{ pkgs, ... }:

{
  xsession = {
    enable = true;

    initExtra = ''
      # dbus — startx doesn't launch it; start manually
      if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
        eval $(${pkgs.dbus}/bin/dbus-launch --exit-with-session --sh-syntax)
      fi
      systemctl --user import-environment DISPLAY XAUTHORITY 2>/dev/null || true

      # Cursor
      ${pkgs.xorg.xsetroot}/bin/xsetroot -cursor_name left_ptr &

      # Keyboard repeat rate (300ms delay, 50/s)
      ${pkgs.xorg.xset}/bin/xset r rate 300 50 &

      # Disable DPMS / blanking on OLED
      ${pkgs.xorg.xset}/bin/xset s off -dpms &

      # Load Xresources
      [ -f ~/.Xresources ] && ${pkgs.xorg.xrdb}/bin/xrdb -merge ~/.Xresources

      # Wallpaper
      ${pkgs.feh}/bin/feh --bg-scale ~/Pictures/wallpaper.jpg &

      # Status bar
      slstatus &
    '';

    windowManager.command = "dwm";
  };

  # Adjust Xft.dpi to your panel (96 = ~1080p 15", 120 = ~1080p 13")
  home.file.".Xresources".text = ''
    Xft.dpi:       96
    Xft.antialias: true
    Xft.hinting:   true
    Xft.hintstyle: hintslight
    Xft.rgba:      none

    *background: #1a1a1a
    *foreground: #d4d4d4
    *color0:     #1a1a1a
    *color1:     #cc6666
    *color2:     #b5bd68
    *color3:     #f0c674
    *color4:     #81a2be
    *color5:     #b294bb
    *color6:     #8abeb7
    *color7:     #c5c8c6
    *color8:     #666666
    *color9:     #cc6666
    *color10:    #b5bd68
    *color11:    #f0c674
    *color12:    #81a2be
    *color13:    #b294bb
    *color14:    #8abeb7
    *color15:    #ffffff
  '';
}
