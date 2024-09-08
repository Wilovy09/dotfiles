{ pkgs, config, ... }:
{
  imports = [
    ./nixosModules/helix/helixConfig.nix
    ./nixosModules/kitty/kittyConfig.nix
    ./nixosModules/picom/picomConf.nix
  ];

  home.username = "wilovy";
  home.homeDirectory = "/home/wilovy";

  home.stateVersion = "24.05";
  home.packages = with pkgs; [ ];
  programs.home-manager.enable = true;
}
