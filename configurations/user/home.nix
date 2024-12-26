{pkgs, ...}: {
  imports = [
    ../../modules/tools/kitty.nix
    ../../modules/tools/picom.nix
    ../../modules/tools/zellij.nix
    ../../modules/desktops/rofi
    ../../modules/editors/nvim
    ./starship_themes/my_prompt.nix
    ../../modules/editors/zed
    ../../modules/services/nushell.nix
  ];

  home.username = "wilovy";
  home.homeDirectory = "/home/wilovy";

  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    sc
  ];
  programs.home-manager.enable = true;
}
