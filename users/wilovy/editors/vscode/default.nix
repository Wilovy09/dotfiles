{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jdinhlife.gruvbox
      cweijan.vscode-database-client2
      vue.volar
      esbenp.prettier-vscode
      dbaeumer.vscode-eslint
    ];
  };
}
