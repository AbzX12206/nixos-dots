{ pkgs, ... }:

{
  xsession = {
    enable = true;

    initExtra = ''
      if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
        eval $(${pkgs.dbus}/bin/dbus-launch --exit-with-session --sh-syntax)
      fi
      systemctl --user import-environment DISPLAY XAUTHORITY 2>/dev/null || true

      # Keyboard: English + Russian, Win+Space to toggle
      ${pkgs.setxkbmap}/bin/setxkbmap -layout us,ru -option grp:win_space_toggle &


      ${pkgs.xset}/bin/xset r rate 300 50 &
      ${pkgs.xset}/bin/xset s off -dpms &
      ${pkgs.xrdb}/bin/xrdb -merge ~/.Xresources
      ${pkgs.feh}/bin/feh --bg-scale ~/Pictures/wallpaper.jpg &
      slstatus &
    '';

    windowManager.command = "dwm";
  };

  xresources.properties = {
    "Xft.dpi" = 192;
    "Xft.antialias" = true;
    "Xft.hinting" = true;
    "Xft.hintstyle" = "hintslight";
    "Xft.rgba" = "none";
    "*background" = "#1a1a1a";
    "*foreground" = "#d4d4d4";
    "*color0" = "#1a1a1a";
    "*color1" = "#cc6666";
    "*color2" = "#b5bd68";
    "*color3" = "#f0c674";
    "*color4" = "#81a2be";
    "*color5" = "#b294bb";
    "*color6" = "#8abeb7";
    "*color7" = "#c5c8c6";
    "*color8" = "#666666";
    "*color9" = "#cc6666";
    "*color10" = "#b5bd68";
    "*color11" = "#f0c674";
    "*color12" = "#81a2be";
    "*color13" = "#b294bb";
    "*color14" = "#8abeb7";
    "*color15" = "#ffffff";
  };
}
