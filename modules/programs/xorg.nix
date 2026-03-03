{ pkgs, ... }:

{
  services.xserver = {
    enable = true;

    xkb = {
      layout  = "us";
      variant = "";
    };

    # Login from TTY, no display manager
    displayManager.startx.enable = true;
  };

  # Libinput — top-level path (canonical since NixOS 23.05)
  services.libinput = {
    enable = true;
    touchpad = {
      tapping            = true;
      naturalScrolling   = true;
      disableWhileTyping = true;
      accelProfile       = "adaptive";
    };
    mouse = {
      accelProfile = "flat"; # no accel on mouse
    };
  };

  # DBus — required for clipboard, portals, notifications to work under startx
  services.dbus.enable = true;

  environment.systemPackages = with pkgs; [
    xorg.xrandr
    xorg.xrdb
    xorg.xinit
    xorg.xset
    xorg.xsetroot
    xclip
    xdotool
    feh          # wallpaper
    scrot        # screenshots
    pulsemixer   # TUI audio mixer
    arandr       # GUI xrandr frontend (useful for multi-monitor)
    networkmanagerapplet  # nm-applet tray icon for NetworkManager
    # dunst is managed via home-manager → home/modules/dunst.nix
  ];
}
