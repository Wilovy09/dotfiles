{pkgs, ...}: {
  imports = [
    ./home/kitty.nix
    ./home/picom.nix
    ./home/zellij.nix
    ./home/rofi/rofi.nix
    ./home/editors/nvim/nvimConf.nix
    ./home/starship_themes/my_prompt.nix
    ./home/editors/zed
  ];

  home.username = "wilovy";
  home.homeDirectory = "/home/wilovy";

  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    sc
  ];
  programs.home-manager.enable = true;
}
