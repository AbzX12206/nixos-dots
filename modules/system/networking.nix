{ ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    # allowedTCPPorts = [ 8080 22 ];  # uncomment to open specific ports
    # allowedUDPPorts = [ ];
  };
}
