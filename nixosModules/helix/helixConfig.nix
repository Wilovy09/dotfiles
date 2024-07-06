{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [ cowsay ];
  programs.helix = {
    enable = true;
    # Ignores
    ignores = [ "!.**" "!.github/" "!.gitignore" "!.gitattributes" "node_modules/" ];
    # Theme
    themes = {
      wilovy =
        let
          myBg = "#191622";
          myBgDark = "#17141F";
          myPink = "#FF79C6";
          myGreen = "#67E480";
          myYellow = "#E7DE79";
          myGold = "#ffed54";
          myWhite = "#FFFFFF";
          myBlue = "#78D1E1";
          myPurple = "#988BC7";
          myComment = "#483C67";
          myOrange = "#E89E64";
          mySelection = "#41414D";
          myRed = "#FF5555";
          myTransparent = "#00000001";
        in
        {
          "type" = myPurple;
          "type.builtin" = myPurple;
          "constant" = myBlue;
          "constructor" = myGreen;
          "string" = myGold;
          "string.special" = myGold;
          "string.regexp" = myPink;
          "comment" = { fg = myComment; modifiers = [ "bold" "italic" ]; };
          "variable" = myWhite;
          "variable.parameter" = myOrange;
          "punctuation" = myWhite;
          "punctuation.bracket" = myYellow;
          "punctuation.delimiter" = myWhite;
          "punctuation.special" = myPink;
          "keyword" = { fg = myPink; modifiers = [ "bold" "italic" ]; };
          "operator" = myPink;
          "function" = { fg = myGreen; modifiers = [ "bold" ]; };
          "tag" = myPink;
          "attribute" = myGreen;
          "ui.background" = { bg = myTransparent; };
          "ui.linenr" = { fg = myComment; modifiers = [ "bold" "italic" ]; };
          "ui.linenr.selected" = myWhite;
          "ui.cursor" = { fg = myWhite; bg = myComment; };
          "ui.cursor.match" = { bg = mySelection; fg = myWhite; };
          "ui.text" = myWhite;
          "ui.text.focus" = myPurple;
          "ui.selection" = { bg = mySelection; };
          "ui.statusline" = { bg = myComment; fg = myWhite; };
          "ui.statusline.normal" = { bg = myComment; fg = myWhite; };
          "ui.statusline.insert" = { bg = myPink; fg = myWhite; };
          "ui.statusline.select" = { bg = myPurple; fg = myWhite; };
          "ui.bufferline" = { fg = myComment; };
          "ui.bufferline.background" = { bg = myTransparent; };
          "ui.bufferline.active" = { fg = myWhite; };
          "ui.menu.selected" = { bg = mySelection; fg = myWhite; };
          "ui.virtual.indent-guide" = { fg = myComment; };
          "markup.link.url" = myBlue;
          "warning" = { fg = myWhite; modifiers = [ "underlined" ]; };
          "error" = { bg = myRed; fg = myWhite; };
          "info" = { fg = myBlue; modifiers = [ "bold" ]; };
          "hint" = { fg = myBlue; modifiers = [ "bold" ]; };
          "diagnostic.hint" = {
            underline = {
              color = myBlue;
              style = "curl";
            };
          };
          "diagnostic.info" = {
            underline = {
              color = myBlue;
              style = "curl";
            };
          };
          "diagnostic.warning" = {
            underline = {
              color = myGreen;
              style = "curl";
            };
          };
          "diagnostic.error" = {
            bg = mySelection;
            fg = myRed;
            modifiers = [ "crossed_out" "bold" ];
          };
          "diff.plus" = { fg = myGreen; };
          "diff.minus" = { fg = myRed; };
          "diff.delta" = { fg = myYellow; };
        };
    };
    # Settings
    settings = {
      theme = "wilovy";
      editor = {
        line-number = "relative";
        mouse = true;
        bufferline = "always";
        color-modes = true;
        scroll-lines = 3;
        scrolloff = 0;
        gutters = [ "diff" "diagnostics" "line-numbers" "spacer" ];
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
          left = [ "mode" "spinner" "spacer" "version-control" ];
          center = [ "file-name" ];
          right = [ "diagnostics" "file-type" "position" ];
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
        "C-g" = [ ":new" ":insert-output lazygit" ":buffer-close!" ":redraw" ];
        "C-v" = ":vsplit-new";
        "C-h" = ":hsplit-new";
        "S-q" = ":quit";
        "A-tab" = ":buffer-next";
        "S-tab" = ":buffer-previous";
        "C-f" = [ ":new" ":insert-output pwd | xplr" ":buffer-close!" ":redraw" ];
        "y" = ":clipboard-yank-join";

        "esc" = {
          "r" = ":config-reload";
          "o" = ":config-open";
          "l" = ":o ~/.config/helix/languages.toml";
          "i" = ":o ~/.config/helix/ignore";
          "q" = ":bc";
          "a" = ":bco";
        };
      };
    };
  };
  # Languages
}
