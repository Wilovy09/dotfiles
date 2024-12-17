{pkgs, ...}: {
  programs = {
    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 7d";
      };
    };
    firefox = {
      enable = true;
      package = pkgs.firefox;
      nativeMessagingHosts.packages = [pkgs.firefoxpwa];
    };
    neovim = {
      enable = true;
    };
    nix-ld = {
      enable = true;
      package = pkgs.nix-ld-rs;
    };
    adb = {
      enable = true;
    };
  };
}
