{ config, lib, pkgs, ... }:
{
  programs.helix = {
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
  };
}
