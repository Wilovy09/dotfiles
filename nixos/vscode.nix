{ lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = [
        vscode-extensions.jdinhlife.gruvbox
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vscode-database-client2";
          publisher = "cweijan";
          version = "7.5.7";
          sha256 = "sha256-Um6Vca8aG6aevUIMgEwJINi+UMhWHIzJC9Z33JXUa38=";
        }
        {
          name = "sqlite-viewer";
          publisher = "qwtel";
          version = "0.6.4";
          sha256 = "sha256-wDSWQ36j6zMUD43PqP+x9VRxgDJJexFpxMyuHpbCi2s=";
        }
      ];
    })
  ];
}


