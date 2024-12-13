{
  lib,
  pkgs,
  ...
}: {
  programs = {
    carapace = {
      enable = true;
    };
    nushell = {
      enable = true;
      shellAliases = let
        g = lib.getExe pkgs.git;
        c = "cargo";
      in {
        # Cargo
        cb = "${c} build";
        cc = "${c} check";
        cn = "${c} new";
        cr = "${c} run";
        cs = "${c} search";
        ct = "${c} test";
        # Git
        ga = "${g} add";
        gc = "${g} commit";
        gd = "${g} diff";
        gl = "${g} log";
        gs = "${g} status";
        gp = "${g} push origin main";

        tree = "eza --tree --level 1 --icons=always";
        icat = "kitten icat";
        sxplr = "sudo xplr";
        nv = "nvim";
      };
      environmentVariables = {
        SHELL = "^${pkgs.nushell}/bin/nu";
      };
      extraConfig = let
        conf = builtins.toJSON {
          show_banner = false;
          ls.clickable_links = true;
          rm.always_trash = true;
          table = {
            mode = "rounded";
            index_mode = "always";
            header_on_separator = false;
          };
        };
      in ''
        $env.config = ${conf};
        load-env (${pkgs.fnm}/bin/fnm env --shell bash
          | lines
          | str replace 'export ' ""
          | str replace -a '"' ""
          | split column '='
          | rename name value
          | where name != "FNM_ARCH" and name != "PATH"
          | reduce -f {} {|it, acc| $acc | upsert $it.name $it.value }
        )
        $env.PATH = ($env.PATH
            | split row (char esep)
            | prepend $"($env.FNM_MULTISHELL_PATH)/bin"
        )
        source /home/wilovy/.config/nushell/extra.nu
      '';
    };
  };
}
