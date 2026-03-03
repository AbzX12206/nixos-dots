{ pkgs, ... }:

{
  services.printing.enable = true;
  services.flatpak.enable  = true;
  services.fprintd.enable  = true;

  # Required for GTK3/4 apps to persist settings (Firefox, LibreOffice, etc.)
  programs.dconf.enable = true;

  # XDG portals — flatpak file pickers, screen sharing
  xdg.portal = {
    enable       = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = [ "gtk" ];
  };
}
