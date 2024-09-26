{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./nixos/boot/boot.nix
    ./nixos/fonts.nix
    ./nixos/sddm.nix
    ./nixos/vscode.nix
    ./nixos/zsh.nix
  ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "America/Monterrey";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.variables.BROWSER = "/run/current-system/sw/bin/zen";

  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "altgr-intl";
    xkb.options = "terminate:ctrl_alt_bksp";
    excludePackages = with pkgs; [xterm];
  };

  services.printing.enable = true;
  services.udisks2.enable = true;
  hardware.pulseaudio.enable = true;

  services.xserver.windowManager.openbox.enable = true;

  services.libinput.enable = true;
  users.users.wilovy = {
    isNormalUser = true;
    extraGroups = ["wheel" "video" "audio" "networkmanager" "docker" "redis"];
    shell = pkgs.nushell;
  };

  environment.variables.FLAKE = "/home/wilovy/wilovy.nix/";
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d";
    };
  };

  system.stateVersion = "24.05";

  programs.nix-ld.enable = true;
  programs.nix-ld.package = pkgs.nix-ld-rs;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    nativeMessagingHosts.packages = [pkgs.firefoxpwa];
  };
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
    redis
    insomnia
    polybar
    rofi
    flameshot
    feh
    obsidian
    gnumake
    gccgo14
    openbox
    obconf
    discord
    unzip
    lazysql
    lxappearance
    lsof
    xclip
    eza
    btop
    firefoxpwa
    gruvbox-plus-icons
    alejandra
    brave
  ];

  # VIM
  programs.neovim = {
    enable = true;
  };

  # DOCKER
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    storageDriver = "btrfs";
  };

  # REDIS redis-server
  services.redis.servers."talos" = {
    enable = true;
  };
}
