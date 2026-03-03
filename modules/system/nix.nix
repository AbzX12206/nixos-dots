{ ... }:

{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    # auto-optimise-store intentionally NOT set — can corrupt the store.
    # Use nix.optimise (scheduled systemd service) instead.
  };

  # Safe store optimisation — runs as a systemd service once a week
  nix.optimise = {
    automatic = true;
    dates     = [ "weekly" ];
  };

  nix.gc = {
    automatic = true;
    dates     = "weekly";
    options   = "--delete-older-than 14d";
  };

  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];

  # stateVersion reflects when you first installed — never change this
  system.stateVersion = "25.11";
}
