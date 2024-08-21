{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./nixosModules/vscode/vscodeConfig.nix
      ./nixosModules/zsh/zshConfig.nix
      ./nixosModules/starship/starshipConfig.nix
      ./nixosModules/fonts/fontsConfig.nix
      ./nixosModules/boot/bootConfig.nix
    ];

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "America/Monterrey";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "altgr-intl";
    xkb.options = "terminate:ctrl_alt_bksp";
    displayManager.lightdm = {
      enable = true;
      background = ./suzume_door.jpg;
      greeters = {
        gtk = {
          enable = true;
          clock-format = "%a, %d %b %H:%M";
          theme = {
            package = pkgs.zuki-themes;
            name = "Zukitre-dark";
          };
        };
      };
    };
    excludePackages = with pkgs; [ xterm ];
  };

  # Desktop
  services.xserver.windowManager.openbox.enable = true;

  services.printing.enable = true;

  hardware.pulseaudio.enable = true;

  services.libinput.enable = true;
  users.users.wilovy = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" "docker" "redis" ];
    shell = pkgs.zsh;
  };

  programs.nh = {
    enable = true;
    flake = "/etc/nixos";
  };

  system.stateVersion = "24.05";

  programs.nix-ld.enable = true;
  programs.nix-ld.package = pkgs.nix-ld-rs;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    nil
    nixpkgs-fmt
    wget
    cmake
    git
    gh
    lazygit
    lazydocker
    xplr
    arandr
    waybar
    brave
    spotify
    go
    fnm
    xfce.thunar
    gvfs
    fzf
    rustup
    gcc_multi
    fastfetch
    dconf
    pavucontrol
    ripgrep
    xdg-utils
    psmisc
    obs-studio
    nix-prefetch
    nix-prefetch-git
    python312
    python312Packages.pip
    (pkgs.python312.withPackages (python-pkgs: [
      python312Packages.python-lsp-server
    ]))
    telegram-desktop
    redis
    lsof
    insomnia
    polybar
    rofi
    flameshot
    feh
    picom
    obsidian
    gnumake
    gccgo14
    openbox
    obconf
    discord
    eww
  ];

  /* DOCKER */
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    storageDriver = "btrfs";
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  /* REDIS */
  /* redis-server */
  services.redis.servers."talos" = {
    enable = true;
  };
}
