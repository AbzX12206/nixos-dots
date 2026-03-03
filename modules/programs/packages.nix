{ pkgs, ... }:

{
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    # editors
    neovim

    # utils
    git
    wget
    curl
    fastfetch
    coreutils
    ripgrep
    fd
    usbutils
    pciutils
    unzip
    zip
    btop

    # media
    blender
    krita
    vlc
    qbittorrent
    localsend

    # office
    libreoffice
    thunderbird

    # games
    crawlTiles
    nethack
    dwarf-fortress
    cataclysm-dda
    shattered-pixel-dungeon
    mindustry
    unciv
    osu-lazer

    # emulators
    retroarch
    ppsspp
  ];
}
