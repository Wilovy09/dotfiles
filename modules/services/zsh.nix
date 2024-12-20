{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    zsh
    oh-my-zsh
  ];

  environment.shellAliases = {
    ls = "eza --tree --level 1 --icons=always";
    icat = "kitten icat";
    sxplr = "sudo xplr";
    gadd = "git add $(git ls-files -m -o --exclude-standard | fzf -m --preview 'git diff --color=always -- {}' --height 40% --layout=reverse)";
    gch = "git branch | fzf --preview 'git show --color=always {-1}' --bind 'enter:become(git checkout {-1})' --height 40% --layout reverse";
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
      plugins = ["git"];
    };
  };
}
