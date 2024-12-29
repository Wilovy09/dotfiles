{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  home.shellAliases = {
    ls = "eza --tree --level 1 --icons=always";
    icat = "kitten icat";
    sxplr = "sudo xplr";
    gadd = "git add $(git ls-files -m -o --exclude-standard | fzf -m --preview 'git diff --color=always -- {}' --height 40% --layout=reverse)";
    gch = "git branch | fzf --preview 'git show --color=always {-1}' --bind 'enter:become(git checkout {-1})' --height 40% --layout reverse";
    zed = "zeditor";
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    ZSH = "${pkgs.oh-my-zsh}/share/oh-my-zsh/oh-my-zsh.sh";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/go/bin"
    "$HOME/.cargo/bin"
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
    };

    initExtra = ''
      eval "$(starship init zsh)"
    '';
  };
}
