{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./theme.nix
  ];

  home.packages = with pkgs; [
    cowsay
  ];

  programs.helix = {
    enable = false;
    ignores = ["!.**" "!.github/" "!.gitignore" "!.gitattributes" "node_modules/"];
    settings = {
      theme = "gruvbox";
      editor = {
        line-number = "relative";
        mouse = true;
        bufferline = "always";
        color-modes = true;
        scroll-lines = 3;
        scrolloff = 0;
        rulers = [80];
        gutters = ["diff" "diagnostics" "line-numbers" "spacer"];
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        lsp = {
          display-inlay-hints = true;
          display-messages = true;
        };
        indent-guides = {
          render = true;
          character = "▏";
          skip-levels = 1;
        };
        statusline = {
          left = ["mode" "spinner" "spacer" "version-control"];
          center = ["file-name"];
          right = ["diagnostics" "file-type" "position"];
          separator = "│";
          mode.normal = "NORMAL";
          mode.insert = "INSERT";
          mode.select = "SELECT";
        };
        soft-wrap = {
          enable = true;
          max-wrap = 25;
          max-indent-retain = 0;
          wrap-indicator = "";
        };
      };
      keys.insert = {
        "C-space" = "completion";
      };
      keys.normal = {
        "C-s" = ":write!";
        "C-g" = [":new" ":insert-output lazygit" ":buffer-close!" ":redraw"];
        "C-v" = ":vsplit-new";
        "C-h" = ":hsplit-new";
        "S-q" = ":quit";
        "A-tab" = ":buffer-next";
        "S-tab" = ":buffer-previous";
        "C-f" = [":new" ":insert-output pwd | xplr" ":buffer-close!" ":redraw"];
        "y" = ":clipboard-yank-join";

        "esc" = {
          "r" = ":config-reload";
          "o" = ":config-open";
          "l" = ":o ~/.config/helix/languages.toml";
          "i" = ":o ~/.config/helix/ignore";
          "q" = ":bc";
          "a" = ":bco";
        };
        "+" = {
          "r" = {
            "r" = ":run-shell-command cargo run";
            "b" = ":run-shell-command cargo build";
          };
        };
      };
    };
  };
}
