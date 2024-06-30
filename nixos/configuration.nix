{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];
  # Boot & GRUB
  boot = {
    consoleLogLevel = 3;
    tmp.cleanOnBoot = true;
    kernelParams = [
      "quiet"
      "splash"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "boot.shell_on_fail"
    ];

    loader = {
      timeout = 3;
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        theme = "/home/wilovy/NIX-CONFIGS/hyprgrub";
        gfxmodeEfi = "1366x768";
        splashImage = null;
      };
    };

    plymouth = {
      enable = true;
      theme = "mac-style";
      themePackages = let
      mac-style-src = pkgs.fetchFromGitHub {
        owner = "SergioRibera";
        repo = "s4rchiso-plymouth-theme";
        rev = "bc585b7f42af415fe40bece8192d9828039e6e20";
        sha256 = "sha256-yOvZ4F5ERPfnSlI/Scf9UwzvoRwGMqZlrHkBIB3Dm/w=";
      };
      mac-style-load = pkgs.callPackage mac-style-src {};
      in [ mac-style-load ];
    };
  };

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
    # desktopManager = {
    #   xterm.enable = false;
    # };
    # windowManager.i3 = {
    #   enable = true;
    #   extraPackages = with pkgs; [
    #     # dmenu    #application launcher most people use
    #     # i3status # gives you the default i3 status bar
    #     # i3lock   #default i3 screen locker
    #     # i3blocks #if you are planning on using i3blocks over i3status
    #  ];
    # };
  };
  # services.xserver.windowManager.i3.enable = true;

  services.printing.enable = true;

  hardware.pulseaudio.enable = true;
  # services.pipewire.enable = true;
  
  services.libinput.enable = true;
  users.users.wilovy = {
    isNormalUser = true;
    extraGroups = [ "wheel"  "video" "audio" "networkmanager" "docker"];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  fonts = {
    enableDefaultPackages = true;
    fontconfig = {
      enable = true;
    };
    packages = with pkgs; [
      jetbrains-mono 
      terminus-nerdfont
    ];
  };
  
  xdg = {
    portal = {
      enable = true;
      wlr.enable = true; # A mi no me da problemas tenerlo en false pero hay gente que si
      xdgOpenUsePortal = false; # Lo tengo en true, pero antes me daba problemas (aun los da de vez en cuando)

      config = {
        common.default = ["gtk"];
        hyprland.default = ["gtk" "hyprland"];
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
    };
  };

  environment.variables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables = rec {
    NIXOS_OZONE_WL =  "1";
    ZSH="/nix/store/hg81kn8jkhgsq794z2mvcsxgppjrz5r0-oh-my-zsh-2024-05-03/share/oh-my-zsh/oh-my-zsh.sh";
    PATH = [ 
      "$HOME/.local/bin"
      "$HOME/go/bin"
      "$HOME/.cargo/bin"
      "${ZSH}"
    ];
  };

  programs.zsh = {
    enable = true;
    interactiveShellInit = ''
      eval $(fnm env)
      export ZSH_CUSTOM=~/NIX-CONFIGS/oh-my-zsh
    '';
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "wilovy";
      plugins = [ "git" ];
    };
  };
  
  environment.shellAliases = {
    ls = "GoLS --emoji --tree";
    icat = "kitten icat";
  };
  
  programs.nh = {
    enable = true;
    flake = "/etc/nixos";
  };    
  
  system.copySystemConfiguration = true;
  system.stateVersion = "24.05";
  
  # Desktop
  programs.hyprland.enable = true;
  
  programs.nix-ld.enable = true;
  programs.nix-ld.package = pkgs.nix-ld-rs;

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wofi
    wget
    oh-my-zsh
    kitty
    zsh
    helix
    git
    gh
    lazygit
    xplr
    arandr
    waybar
    brave
    vesktop    
    spotify
    go
    fnm
    xfce.thunar
    rustup
    gcc_multi
    fastfetch
    swww
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
    plymouth
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    xwaylandvideobridge
    xwayland
    psmisc
    obs-studio
    python312
    python312Packages.pip
    (pkgs.python312.withPackages (python-pkgs: [
      python312Packages.python-lsp-server
    ]))
  ];
}
