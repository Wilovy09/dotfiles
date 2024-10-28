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

  environment.variables.BROWSER = "/run/current-system/sw/bin/zen";

  hardware.pulseaudio.enable = true;

  users.users.wilovy = {
    isNormalUser = true;
    extraGroups = ["wheel" "video" "audio" "networkmanager" "docker" "redis"];
    shell = pkgs.zsh;
  };

  environment.variables.FLAKE = "/home/wilovy/wilovy.nix/";

  system.stateVersion = "24.05";

  nix.settings.experimental-features = ["nix-command" "flakes"];
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
    spotify
    fnm
    gvfs
    fzf
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
    zed-editor
    rustup
    hoppscotch
    onefetch
    rio
    zip
  ];

  # DOCKER
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;
    };
  };
}
