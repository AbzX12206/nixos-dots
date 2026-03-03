{ ... }:

{
  security.sudo = {
    enable        = true;
    execWheelOnly = true; # only Nix store binaries can be sudo'd — prevents PATH hijacking
  };

  security.polkit.enable = true;
  # security.rtkit is enabled in hardware/audio.nix (required by pipewire)
}
