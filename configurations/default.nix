{pkgs, ...}: {
  imports = [
    ./nix
    ./boot
    ./core
    ./basics
  ];

  system.stateVersion = "24.11";

  services.xserver.windowManager.leftwm.enable = true;

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
  };

  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  programs.zsh.enable = true;
  users.users.wilovy = {
    isNormalUser = true;
    extraGroups = ["wheel" "video" "audio" "docker" "redis" "adbusers" "networkmanager"];
    shell = pkgs.nushell;
  };
  services.xserver.excludePackages = with pkgs; [xterm];

  environment.systemPackages = with pkgs; [
    gh
    git
    lazygit
  ];
}
