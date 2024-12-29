{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./nix
      ./boot
      ./core
      ./basics
    ];

  system.stateVersion = "24.11";

  services.xserver.enable = true;

  # ~~~ DESKTOP ~~~
  services.xserver.windowManager.leftwm.enable = true;
  # ~~~~~~~~~~~~~~~

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  programs.zsh.enable = true;
  users.users.wilovy = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "docker" "redis" "adbusers" "networkmanager" ];
    packages = with pkgs; [];
    shell = pkgs.zsh; 
  };


  environment.systemPackages = with pkgs; [
    gh
    git
    lazygit
  ];
}
