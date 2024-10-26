{pkgs, ...}: {
  imports = [
    ./home/kitty.nix
    ./home/picom.nix
    ./home/zellij.nix
    ./home/openbox/openbox.nix
    ./home/rofi/rofi.nix
    ./home/nvim/nvimConf.nix
    ./home/nushell.nix
    ./home/starship_themes/my_prompt.nix
  ];

  home.username = "wilovy";
  home.homeDirectory = "/home/wilovy";

  home.stateVersion = "24.05";
  home.packages = with pkgs; [];
  programs.home-manager.enable = true;
}
