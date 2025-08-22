{pkgs, ...}: {
  imports = [
    ./wm
    ./terminal
    ./shells
    ./desktop
    ./editors
    ./ssh
  ];

  home.username = "wilovy";
  home.homeDirectory = "/home/wilovy";
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  home.sessionVariables = {
    SHELL = "nu";
  };

  home.packages = with pkgs; [
    zoxide

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
    jetbrains.datagrip

    wget

    # LS
    eza

    # NODE
    #fnm
    #nodejs_22
    #volta

    # Browser
    brave
    firefox

    # File manager
    yazi
    # xplr

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
    
    # SDDM
    sddm-wilovy-theme

    zellij
    nushellPlugins.gstat

    # Bluetooth
    bluetuith
    bluetui

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
    # deadd-notification-center
  ];
}
