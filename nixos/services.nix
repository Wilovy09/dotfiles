{
  pkgs,
  lib,
  ...
}: {
  services.pipewire.enable = lib.mkForce false;
  services = {
    printing = {
      enable = true;
    };
    udisks2 = {
      enable = true;
    };
    libinput = {
      enable = true;
    };
    redis = {
      servers."talos" = {
        enable = true;
      };
    };
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "altgr-intl";
      xkb.options = "terminate:ctrl_alt_bksp";
      excludePackages = with pkgs; [xterm];
      windowManager = {
        openbox = {
          enable = false;
        };
        leftwm = {
          enable = true;
        };
      };
    };
  };
}
