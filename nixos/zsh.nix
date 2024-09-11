{ config, lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    zsh
    oh-my-zsh
  ];

  environment.shellAliases = {
    ls = "GoLS --emoji --tree";
    icat = "kitten icat";
    shx = "sudo hx";
    sxplr = "sudo xplr";
  };

  environment.variables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables = rec {
    NIXOS_OZONE_WL = "1";
    ZSH = "/nix/store/hg81kn8jkhgsq794z2mvcsxgppjrz5r0-oh-my-zsh-2024-05-03/share/oh-my-zsh/oh-my-zsh.sh";
    PATH = [
      "$HOME/.local/bin"
      "$HOME/go/bin"
      "$HOME/.cargo/bin"
      "${ZSH}"
    ];
  };
  # export ZSH_CUSTOM=~/NIX-CONFIGS/oh-my-zsh

  programs.zsh = {
    enable = true;
    interactiveShellInit = ''
      eval $(fnm env)
      eval "$(starship init zsh)"
    '';
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };
}
