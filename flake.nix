{
  description = "abzal's NixOS flake — dwm minimal";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = { inherit inputs; };

      modules = [
        ./hardware-configuration.nix
        ./modules/hardware/nvidia.nix
        ./modules/hardware/audio.nix
        ./modules/hardware/bluetooth.nix
        ./modules/hardware/display.nix
        ./modules/hardware/laptop.nix
        ./modules/system/boot.nix
        ./modules/system/locale.nix
        ./modules/system/networking.nix
        ./modules/system/security.nix
        ./modules/system/services.nix
        ./modules/system/users.nix
        ./modules/system/nix.nix
        ./modules/programs/suckless.nix
        ./modules/programs/xorg.nix
        ./modules/programs/packages.nix
        ./modules/programs/shell.nix
        ./modules/programs/devshell.nix
        ./modules/programs/virtualisation.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs    = true;
          home-manager.useUserPackages  = true;
          home-manager.users.abzal      = import ./home/default.nix;
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };
  };
}
