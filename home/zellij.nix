{ config, lib, pkgs, ... }:

let
  gruvboxTheme = {
    fg = "#ebdbb2";
    bg = "#282828";
    black = "#1d2021";
    red = "#cc241d";
    green = "#98971a";
    yellow = "#d79921";
    blue = "#458588";
    magenta = "#b16286";
    cyan = "#689d6a";
    white = "#a89984";
    orange = "#d65d0e";
  };
in {
  programs.zellij = {
    enable = true;
    settings = {
      pane_frames = false;
      theme = "custom";
      themes.custom = gruvboxTheme;
    };
  };
}


