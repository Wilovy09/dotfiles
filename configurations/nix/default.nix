{...}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnsupportedSystem = true;
  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = {
    system = "x86_64-linux";
  };
  environment.variables.FLAKE = "/home/wilovy/wilovy.nix";
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d";
    };
  };
  # Run unpatched dynamic binaries on NixOS.
  #programs.nix-ld = {
  #  enable = true;
  #  package = pkgs.nix-ld-rs;
  #};
}
