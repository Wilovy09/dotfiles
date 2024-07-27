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

  # environment.pathsToLink = [ "/run/current-system/sw" ];
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "altgr-intl";
    xkb.options = "terminate:ctrl_alt_bksp";
    displayManager = {
      lightdm = {
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
    };
  };

  services.printing.enable = true;

  hardware.pulseaudio.enable = true;

  services.libinput.enable = true;
  users.users.wilovy = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" "docker" "redis" ];
    shell = pkgs.zsh;
  };

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = false;
      wlr.enable = true;
      config = {
        common.default = [ "gtk" ];
        hyprland.default = [ "gtk" "hyprland" ];
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
    };
  };

  programs.nh = {
    enable = true;
    flake = "/etc/nixos";
  };

  system.stateVersion = "24.05";

  # Desktop
  programs.hyprland = {
    enable = true;
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.package = pkgs.nix-ld-rs;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    nil
    nixpkgs-fmt
    wofi
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
    vesktop
    spotify
    go
    fnm
    xfce.thunar
    gvfs
    fzf
    rustup
    gcc_multi
    fastfetch
    swaybg
    grim
    swappy
    slurp
    yazi
    dconf
    pavucontrol
    wlogout
    swaylock-effects
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
  ];

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    storageDriver = "btrfs";
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  services.redis.servers."talos" = {
    enable = true;
  };
}
