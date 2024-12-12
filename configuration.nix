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
    # alejandra
    nixd # nix lsp
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
    ripgrep                     # grep²
    xdg-utils
    psmisc
    xclip
    lsof                        # view ports
    fastfetch                   # see pc specs
    gruvbox-plus-icons
    fzf                         # GOD
    lazydocker                  # like docker desktop, but in terminal
    lazysql                     # DBs clients
    redis                       # 
    flameshot                   # screenshots
    obsidian                    # notes
    lxappearance                # styles
    btop                        # task manager
    rustup                      # rust
    onefetch                    # see github project stats
    obs-studio                  # to record screen
    thunderbird                 # email client
    omnisharp-roslyn            # C#
    ngrok                       # tunnels
    bloomrpc                    # gRPC gui client
    scrcpy                      # to share phone screen
  ];

  # DOCKER
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;
    };
  };
}
