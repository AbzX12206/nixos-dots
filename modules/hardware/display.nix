{ pkgs, ... }:

{
  # Font rendering tweaks — optimised for OLED (no subpixel, slight hinting)
  # DPI is set per-user via ~/.Xresources (see home/modules/xsession.nix)
  fonts.fontconfig = {
    enable    = true;
    antialias = true;
    hinting = {
      enable = true;
      style  = "slight";
    };
    subpixel = {
      # OLED panels: subpixel rendering adds colour fringing — use "none"
      rgba      = "none";
      lcdfilter = "none";
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    dejavu_fonts
    liberation_ttf
    vista-fonts
    corefonts
  ];
}
