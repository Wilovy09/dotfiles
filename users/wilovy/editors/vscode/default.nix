{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  programs.vscode = {
    enable = true;
    extensions = [
      pkgs.vscode-extensions.jdinhlife.gruvbox
      pkgs.vscode-extensions.cweijan.vscode-database-client2
    ];
  };
}
