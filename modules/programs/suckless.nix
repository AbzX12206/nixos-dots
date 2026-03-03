{ pkgs, lib, ... }:

let
  # -------------------------------------------------------------------------
  # dwm
  # -------------------------------------------------------------------------
  dwm = pkgs.dwm.overrideAttrs (old: {
    src = pkgs.fetchFromGitHub {
      owner = "abzal";
      repo  = "dwm";
      rev   = "HEAD";
      hash  = lib.fakeHash; # replace with real hash after first build
    };
    # src = ./suckless/dwm;
    buildInputs = old.buildInputs ++ [ pkgs.xorg.libXft pkgs.harfbuzz ];
  });

  # -------------------------------------------------------------------------
  # dmenu
  # -------------------------------------------------------------------------
  dmenu = pkgs.dmenu.overrideAttrs (old: {
    src = pkgs.fetchFromGitHub {
      owner = "abzal";
      repo  = "dmenu";
      rev   = "HEAD";
      hash  = lib.fakeHash;
    };
    # src = ./suckless/dmenu;
    buildInputs = old.buildInputs ++ [ pkgs.xorg.libXft pkgs.harfbuzz ];
  });

  # -------------------------------------------------------------------------
  # st
  # -------------------------------------------------------------------------
  st = pkgs.st.overrideAttrs (old: {
    src = pkgs.fetchFromGitHub {
      owner = "abzal";
      repo  = "st";
      rev   = "HEAD";
      hash  = lib.fakeHash;
    };
    # src = ./suckless/st;
    buildInputs = old.buildInputs ++ [ pkgs.xorg.libXft pkgs.harfbuzz ];
  });

  # -------------------------------------------------------------------------
  # slstatus
  # -------------------------------------------------------------------------
  slstatus = pkgs.slstatus.overrideAttrs (old: {
    src = pkgs.fetchFromGitHub {
      owner = "abzal";
      repo  = "slstatus";
      rev   = "HEAD";
      hash  = lib.fakeHash;
    };
    # src = ./suckless/slstatus;
  });

  # -------------------------------------------------------------------------
  # slock
  # -------------------------------------------------------------------------
  slock = pkgs.slock.overrideAttrs (old: {
    src = pkgs.fetchFromGitHub {
      owner = "abzal";
      repo  = "slock";
      rev   = "HEAD";
      hash  = lib.fakeHash;
    };
    # src = ./suckless/slock;
  });

in
{
  environment.systemPackages = [ dwm dmenu st slstatus slock ];

  security.wrappers.slock = {
    source      = "${slock}/bin/slock";
    owner       = "root";
    group       = "root";
    setuid      = true;
    permissions = "u+rx,g+x,o+x";
  };
}
