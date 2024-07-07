{ config, lib, pkgs, ... }:
{
  programs.helix = {
    themes = {
      wilovy =
        let
          none = "NONE";
          bg = "#191622";
          bg_dark = "#13111B";
          bg_darker = "#15121E";
          bg_light = "#201B2D";
          bg_lighter = "#252131";
          fg = "#E1E1E6";
          comment = "#483C67";
          selection = "#41414D";
          cyan = "#78D1E1";
          pink = "#FF79C6";
          purple = "#988BC7";
          orange = "#E89E64";
          yellow = "#E7DE79";
          green = "#67E480";
          red = "#E96379";
          git_add = "#67E480";
          git_change = "#78D1E1";
          git_delete = "#ED4556";
          git_change_moved = "#78D1E1";
          git_conflict = "#BB7A61";
        in
        {
          "type" = purple;
          "type.builtin" = purple;
          "constant" = cyan;
          "constructor" = green;
          "string" = yellow;
          "string.special" = yellow;
          "string.regexp" = pink;
          "comment" = { fg = comment; modifiers = [ "bold" "italic" ]; };
          "variable" = fg;
          "variable.parameter" = orange;
          "punctuation" = fg;
          "punctuation.bracket" = yellow;
          "punctuation.delimiter" = fg;
          "punctuation.special" = pink;
          "keyword" = { fg = pink; modifiers = [ "bold" "italic" ]; };
          "operator" = pink;
          "function" = { fg = green; modifiers = [ "bold" ]; };
          "tag" = pink;
          "attribute" = green;

          # Yo lo desactivo porque me gusta más como se ve en fondo negro y transparente con la config de hyprland
          # "ui.background" = { bg = bg; fg = fg; };
          "ui.linenr" = { fg = comment; modifiers = [ "bold" "italic" ]; };
          "ui.linenr.selected" = fg;
          "ui.cursor" = { fg = fg; bg = comment; };
          "ui.cursor.match" = { bg = selection; fg = fg; };
          "ui.text" = fg;
          "ui.text.focus" = purple;
          "ui.selection" = { bg = selection; };
          "ui.statusline" = { bg = comment; fg = fg; };
          "ui.statusline.normal" = { bg = comment; fg = fg; };
          "ui.statusline.insert" = { bg = pink; fg = fg; };
          "ui.statusline.select" = { bg = purple; fg = fg; };
          # Lo mismo que arriba pasa aqui.
          # "ui.bufferline" = { fg = comment; };
          "ui.bufferline.background" = { bg = none; };
          "ui.bufferline.active" = { fg = fg; };
          "ui.menu" = { bg = bg_dark; fg = fg; };
          "ui.menu.selected" = { bg = selection; fg = fg; };
          "ui.popup" = { bg = bg_dark; fg = fg; };
          "ui.virtual.indent-guide" = { fg = comment; };

          "markup.bold" = { modifiers = [ "bold" ]; };
          "markup.heading" = { fg = cyan; modifiers = [ "bold" ]; };
          "markup.heading.completion" = { bg = bg_dark; fg = fg; };
          "markup.heading.hover" = { bg = bg_darker; };
          "markup.italic" = { modifiers = [ "italic" ]; };
          "markup.link" = { fg = cyan; underline = { style = "line"; }; };
          "markup.link.label" = { fg = fg; };
          "markup.link.text" = { fg = fg; };
          "markup.link.url" = { fg = cyan; underline = { style = "line"; }; };
          "markup.list" = { fg = orange; modifiers = [ "bold" ]; };
          "markup.normal.completion" = { fg = comment; };
          "markup.normal.hover" = { fg = fg; };
          "markup.raw" = { fg = fg; };
          "markup.raw.inline" = { bg = bg_darker; fg = cyan; };
          "markup.strikethrough" = { modifiers = [ "crossed_out" ]; };

          "warning" = {
            fg = fg;
            modifiers = [ "underlined" ];
          };
          "error" = { bg = red; fg = fg; };
          "info" = { fg = cyan; modifiers = [ "bold" ]; };
          "hint" = { fg = cyan; modifiers = [ "bold" ]; };
          "diagnostic.hint" = {
            underline = {
              color = cyan;
              style = "curl";
            };
          };
          "diagnostic.info" = {
            underline = {
              color = cyan;
              style = "curl";
            };
          };
          "diagnostic.warning" = {
            underline = {
              color = green;
              style = "curl";
            };
          };
          "diagnostic.error" = {
            bg = selection;
            fg = red;
            modifiers = [ "crossed_out" "bold" ];
          };
          "diagnostic.deprecated" = {
            modifiers = [ "crossed_out" ];
          };

          "diff.plus" = { fg = git_add; };
          "diff.minus" = { fg = git_delete; };
          "diff.delta" = { fg = git_change; };
          "diff.delta.moved" = { fg = git_change_moved; };
        };
    };
  };
}
