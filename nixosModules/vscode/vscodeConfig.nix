{ lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = [
        vscode-extensions.github.copilot-chat
        vscode-extensions.esbenp.prettier-vscode
        vscode-extensions.bradlc.vscode-tailwindcss
        vscode-extensions.usernamehw.errorlens
        vscode-extensions.dbaeumer.vscode-eslint
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "theme-omni";
          publisher = "rocketseat";
          version = "1.0.12";
          sha256 = "sha256-rZzyMc9iCVjEFmWCiLuKqohBwSbqoKEYRR2Bn5f6dbU=";
        }
        {
          name = "catppuccin-vsc-icons";
          publisher = "Catppuccin";
          version = "1.13.0";
          sha256 = "sha256-4gsblUMcN7a7UgoklBjc+2uiaSERq1vmi0exLht+Xi0=";
        }
        {
          name = "adonis-vscode-extension";
          publisher = "jripouteau";
          version = "1.3.1";
          sha256 = "sha256-36bk5tmksMX7O8n6NiEPTPBxjfNVAd7I6uBLhQVDC9U=";
        }
        {
          name = "vscode-edge";
          publisher = "AdonisJS";
          version = "1.5.0";
          sha256 = "sha256-B/dmb2HyeoKLxZv383TspEgLlGuUC52PHKiFyIKBrlc=";
        }
        {
          name = "japa-vscode";
          publisher = "jripouteau";
          version = "2.1.3";
          sha256 = "sha256-rvs1cxvX1M5iOUOebm36o8UNx9vUYOt8JVA+A5v3frU=";
        }
        {
          name = "color-highlight";
          publisher = "naumovs";
          version = "2.8.0";
          sha256 = "sha256-mT2P1lEdW66YkDRN6fi0rmmvvyBfXiJjAUHns8a8ipE=";
        }
        {
          name = "auto-rename-tag";
          publisher = "formulahendry";
          version = "0.1.10";
          sha256 = "sha256-uXqWebxnDwaUVLFG6MUh4bZ7jw5d2rTHRm5NoR2n0Vs=";
        }
        {
          name = "dancehelix";
          publisher = "silverquark";
          version = "0.5.16";
          sha256 = "sha256-oHwtlbB18ctEnfStDOpJ+2/Kq41JZog8FVhTa1/s7m0=";
        }
        {
          name = "gitlens";
          publisher = "eamodio";
          version = "2024.7.818";
          sha256 = "sha256-m+Jda8UTTMITvzwHfOhsS3qskqWq/JwXZLTZsntUxx4=";
        }
        {
          name = "copilot";
          publisher = "Github";
          version = "1.211.977";
          sha256 = "sha256-5Ekqw3DY/lAUj0Kou4YYNwJUdCQDeX0UyH3pc/Tl4so=";
        }
      ];
    })
  ];
}
