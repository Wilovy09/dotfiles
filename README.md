# Mis dotfiles

- [NixOS](https://nixos.org/) es mi OS.
- [Hyprland](https://hyprland.org/) es mi escritorio.
- [Helix](https://helix-editor.com/) es mi editor principal.
  - [VSCode](https://code.visualstudio.com/) es mi editor secundario.
- [xplr](https://xplr.dev/) es mi explorador de archivos.
  - [thunar](https://docs.xfce.org/xfce/thunar/start) es mi explorador secundario.
- [ZSH](https://www.zsh.org/) es mi shell.
- [Kitty](https://sw.kovidgoyal.net/kitty/) es mi terminal.
- [Starship](https://starship.rs/) es mi prompt.

## Estructura del repo

Estos dotfiles son de un novato con NixOS.

```txt
📁./wilovy.nix
├──📄README.md
├──📄configuration.nix
├──📄flake.lock
├──📄flake.nix
├──📄hardware-configuration.nix
├──📄home.nix
├──📁nixosModules
│  ├──📁boot
│  │  ├──📄bootConfig.nix
│  │  └──📁hyprgrub
│  ├──📁fonts
│  │  └──📄fontsConfig.nix
│  ├──📁helix
│  │  ├──📄base.toml
│  │  ├──📄helixConfig.nix
│  │  ├──📄languages.toml
│  │  └──📄theme.nix
│  ├──📁kitty
│  │  └──📄kittyConfig.nix
│  ├──📁starship
│  │  └──📄starshipConfig.nix
│  ├──📁vscode
│  │  └──📄vscodeConfig.nix
│  └──📁zsh
│     └──📄zshConfig.nix
├──📄suzume_door.jpg
└──📄updateDotFile.py
```

## Migrando configuraciones

* [ ] Hyprland.
* [ ] Waybar.
* [ ] Wofi.
* [ ] Wlogout.

