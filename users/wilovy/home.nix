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
    eww

    # Screenshot
    flameshot

    # Social
    discord
    spotify

    # Backgrounds
    feh

    # Compress & Decompress
    unzip
    ouch

    arandr
    xorg.xrandr
    
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
    onefetch
    obs-studio
    omnisharp-roslyn
    ngrok
    bloomrpc
    scrcpy
    deadd-notification-center
  ];
}
