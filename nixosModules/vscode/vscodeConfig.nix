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
        vscode-extensions.pkief.material-icon-theme
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "theme-omni";
          publisher = "rocketseat";
          version = "1.0.12";
          sha256 = "sha256-rZzyMc9iCVjEFmWCiLuKqohBwSbqoKEYRR2Bn5f6dbU=";
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
        {
          name = "edge";
          publisher = "luongnd";
          version = "0.3.2";
          sha256 = "sha256-B9rY3tWYe4E1eY+ScWnkkzfmem4IwjyY7w9+q5q2StY=";
        }
        {
          name = "volar";
          publisher = "Vue";
          version = "2.0.28";
          sha256 = "sha256-f0nnmQemu6DxveQfJJrZGrj3dOTHhH1wYJGnNJlM6sU=";
        }
        {
          name = "indenticator";
          publisher = "SirTori";
          version = "0.7.0";
          sha256 = "sha256-J5iNO6V5US+GFyNjNNA5u9H2pKPozWKjQWcLAhl+BjY=";
        }
        {
          name = "apc-extension";
          publisher = "drcika";
          version = "0.3.9";
          sha256 = "sha256-VMUICGvAFWrG/uL3aGKNUIt1ARovc84TxkjgSkXuoME=";
        }
      ];
    })
  ];
}

