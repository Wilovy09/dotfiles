{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./nixos/boot/boot.nix
    ./nixos/fonts.nix
    ./nixos/sddm.nix
    ./nixos/vscode.nix
    ./nixos/zsh.nix
    ./nixos/services.nix
    ./nixos/programs.nix
    ./nixos/portals.nix
  ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "America/Monterrey";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.variables.BROWSER = "/run/current-system/sw/bin/brave";

  hardware.pulseaudio.enable = true;

  users.users.wilovy = {
    isNormalUser = true;
    extraGroups = ["wheel" "video" "audio" "networkmanager" "docker" "redis" "adbusers"];
    shell = pkgs.zsh;
  };

  environment.variables.FLAKE = "/home/wilovy/wilovy.nix/";

  system.stateVersion = "24.05";

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # NIX
    nil
    alejandra
    nixd
    nixpkgs-fmt
    nix-prefetch
    nix-prefetch-git

    # C/C++
    cmake
    gcc_multi
    gnumake
    gccgo14

    # GIT
    git
    gh
    lazygit

    # FILE MANAGERS
    xplr
    libsForQt5.dolphin

    # SCREEN MANAGEMEN
    arandr

    # NODE
    fnm

    # PYTHON
    python312
    python312Packages.pip
    (pkgs.python312.withPackages (python-pkgs: [
      python312Packages.python-lsp-server
    ]))

    # BROWSERS
    brave
    firefoxpwa

    # EDITORS
    zed-editor

    # SOCIAL
    # revolt-desktop # like discord
    discord

    # MUSIC
    spotify

    # STATUS BAR
    polybar
    rofi

    # LS
    eza

    # Backgrounds
    feh

    # MISC
    gvfs
    dconf
    pavucontrol
    pkg-config
    ripgrep
    xdg-utils
    psmisc
    xclip
    lsof
    fastfetch
    gruvbox-plus-icons
    fzf
    lazydocker
    lazysql
    redis
    flameshot
    obsidian
    lxappearance
    btop
    rustup
    onefetch
    obs-studio
    thunderbird
    omnisharp-roslyn
    ngrok
    bloomrpc
    scrcpy
  ];

  # DOCKER
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;
    };
  };
}
