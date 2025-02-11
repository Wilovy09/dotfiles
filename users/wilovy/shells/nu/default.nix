{
  config,
  pkgs,
  ...
}:{
  programs.carapace.enable = true;

  xdg.configFile = {
    "nushell/git.nu".source = ./git.nu;
    "nushell/prompt.nu".source = ./prompt.nu;
  };

  programs.nushell = {
    enable = true;
    envFile.source = ./env.nu;
    shellAliases = {
      ns = "nh os switch --ask . -- --show-trace";
      glol = "${pkgs.git}/bin/git log --graph --all --decorate --format=format:'%C(dim)%h - %C(reset)%C(bold cyan)%ah %C(green)(%ar)%C(yellow)%d%C(reset)%n          %s%C(dim
white) - %an%C(reset)'";
      nix-zellij = "nix develop -c zellij attach --create";
      icat = "kitten icat";
      zed = "zeditor";
      ga = "git add";
    };

    environmentVariables = {
      SHELL = ''${pkgs.nushell}/bin/nu'';
      EDITOR = ''${
          if config.programs.neovim.enable
          then "${config.programs.neovim.package}/bin/nvim"
          else "nano"
        }'';
    };

    extraConfig = let
      nu_script = path: "source ${pkgs.nu_scripts}/share/nu_scripts/${path}.nu";
      completion = path: nu_script "custom-completions/${path}/${path}-completions";
      custom_menu = path: nu_script "custom-menus/${path}";
    in ''
      ${completion "cargo"}
      ${completion "git"}
      ${custom_menu "zoxide-menu"}

      $env.config.show_banner = false;

      use std

      std ellie
    '';
  };
}
