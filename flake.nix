{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # zen-browser.url = "github:MarceColl/zen-browser-flake";
    # cartero.url = "github:danirod/cartero";
    fenix.url = "github:nix-community/fenix/monthly";
  };
  outputs = inputs @ {
    nixpkgs,
    home-manager,
    ...
  }: let
    overlay = import ./modules/pkgs;
  in {
    nixosConfigurations = {
      "nixos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.wilovy = import ./configurations/user/home.nix;
            home-manager.backupFileExtension = "hm-backup";
          }
          {
            nixpkgs.overlays = [overlay inputs.fenix.overlays.default];
            environment.systemPackages = [
              # inputs.zen-browser.packages."x86_64-linux".default  # O specific o generic
              # inputs.cartero.packages."x86_64-linux".default
              inputs.fenix.packages.x86_64-linux.stable.toolchain
            ];
          }
        ];
      };
    };
  };
}
