{pkgs, ...}: {
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
        theme = "/etc/nixos/nixosModules/boot/hyprgrub";
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
      in [mac-style-load];
    };
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    plymouth
  ];
}
