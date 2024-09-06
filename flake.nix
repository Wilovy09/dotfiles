{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs = inputs@{ nixpkgs, home-manager, zen-browser, ... }: {
    nixosConfigurations = {
      "nixos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.wilovy = import ./home.nix;
            home-manager.backupFileExtension = "hm-backup";
          }
          # Agrega el paquete zen-browser directamente
          {
            environment.systemPackages = with inputs.zen-browser.packages."x86_64-linux"; [
              default  # O specific o generic
            ];
          }
        ];
      };
    };
  };
}

