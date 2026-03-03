{ pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      name    = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    iconTheme = {
      name    = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name    = "phinger-cursors-dark";
      package = pkgs.phinger-cursors;
      size    = 24;
    };

    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
  };

  # Applies cursor in dwm itself (not just inside GTK apps)
  home.pointerCursor = {
    name       = "phinger-cursors-dark";
    package    = pkgs.phinger-cursors;
    size       = 24;
    x11.enable = true;
  };

  xdg.userDirs = {
    enable            = true;
    createDirectories = true;
    desktop     = "$HOME/Desktop";
    documents   = "$HOME/Documents";
    download    = "$HOME/Downloads";
    music       = "$HOME/Music";
    pictures    = "$HOME/Pictures";
    videos      = "$HOME/Videos";
    templates   = "$HOME/Templates";
    publicShare = "$HOME/Public";
  };
}
