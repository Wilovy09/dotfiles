{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    fenix.url = "github:nix-community/fenix/monthly";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: let 
   hostname = "nixos";
   user = "wilovy";
   overlay = import ./pkgs; # Custom PKGs
  in{
    nixosConfigurations = {
      "${hostname}" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configurations
	  ./hosts/thinkpad # hardware-config
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
	    home-manager.backupFileExtension = "hm-backup";
            home-manager.users.${user} = import ./users/${user}/home.nix;
            
	    nixpkgs.overlays = [overlay inputs.fenix.overlays.default];
            environment.systemPackages = [
              inputs.fenix.packages.x86_64-linux.stable.toolchain
            ];
          }
        ];
      };
    };
  };
}
