{pkgs, ...}: {
  imports = [
    ./wm
    ./terminal
    ./shells
    ./desktop
    ./editors
  ];

  home.username = "wilovy";
  home.homeDirectory = "/home/wilovy";
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  home.sessionVariables = {};

  home.packages = with pkgs; [
    # LSP
    lua-language-server

    # NIX
    nil
    alejandra
    nixd
    nixpkgs-fmt
    nix-prefetch
    nix-prefetch-git

    # C/C++
    cmake
    gnumake
    gccgo14

    # Simple-commits
    sc

    # Editors
    zed-editor

    wget

    # LS
    eza

    # NODE
    #fnm
    nodejs_22

    # Browser
    brave

    # File manager
    xplr

    # Clipboard
    xclip

    # Bar
    polybar
    rofi

    # Screenshot
    flameshot

    # Social
    discord

    # Backgrounds
    feh

    # Compress & Decompress
    unzip
    ouch

    # MISC
    gvfs
    dconf
    pavucontrol
    pkg-config
    ripgrep
    xdg-utils
    psmisc
    lsof
    fastfetch
    gruvbox-plus-icons
    fzf
    lazydocker
    lazysql
    redis
    obsidian
    lxappearance
    btop
    rustup
    onefetch
    obs-studio
    omnisharp-roslyn
    ngrok
    bloomrpc
    scrcpy
    deadd-notification-center
  ];
}
